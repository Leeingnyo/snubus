class RoutesController < ApplicationController
  def show_routes
    if params[:departure] == nil || params[:destination] == nil
      redirect_to :root
      return
    end
    departure = Stop.find_by(:stop_id => params[:departure])
    destination = Stop.find_by(:stop_id => params[:destination])
    if departure == nil || destination == nil
      redirect_to :root
      return
    end

    @from = departure.name
    @to = destination.name
    @routes = Array.new
    from_stop_list = Array.new
    to_stop_list = Array.new
    if departure.property == "spot"
      Edge.where(:line_id => "walk", :from => departure.stop_id).each do |edge|
        from_stop_list.push(Stop.find_by(:stop_id => edge.to))
      end
    else
      from_stop_list.push(departure)
    end

    if destination.property == "spot"
      Edge.where(:line_id => "walk", :to => destination.stop_id).each do |edge|
        to_stop_list.push(Stop.find_by(:stop_id => edge.from))
      end
    elsif destination.property == "station"
      to_stop_list.push(Stop.find_by(:stop_id => "3719"))
      to_stop_list.push(Stop.find_by(:stop_id => "10422"))
    else
      to_stop_list.push(destination)
    end

    from_stop_list.each do |from_stop|
      to_stop_list.each do |to_stop|
        temp_routes = find_route(from_stop, to_stop, 0)
        if departure.property == "spot"
          temp_routes.each do |route|
            edge = Edge.find_by(:line_id => "walk", :from => departure.stop_id, :to => from_stop.stop_id)
            subroute = SubRoute.new(departure, from_stop, Line.find_by(:line_id => "walk"), edge.time, 0)
            route.subroutes.unshift(subroute)
            route.from = departure
            route.time += edge.time
          end
        end
        if destination.property == "spot"
          temp_routes.each do |route|
            edge = Edge.find_by(:line_id => "walk", :from => to_stop.stop_id, :to => destination.stop_id)
            subroute = SubRoute.new(to_stop, destination, Line.find_by(:line_id => "walk"), edge.time, 0)
            route.subroutes.push(subroute)
            route.to = destination
            route.time += edge.time
          end
        end
        @routes += temp_routes
      end
    end
    @routes.sort! { |a, b| a.time <=> b.time}
    remove_too_long_routes(@routes)
    @routes.each do |route|
      if route.to.stop_id == "3719" || route.to.stop_id == "10422"
        now = Time.now
        arrive = now + route.time
        today = Time.new(arrive.year, arrive.month, arrive.day)
        time = (arrive - today) / 60
        station_name = route.to.stop_id == "3719" ? "서울대입구역" : "낙성대역"
        daytype = today.saturday? ? 1 : today.sunday? ? 2 : 0
        route.subway_to_sadang = Station.where(:name => station_name, :direction => "사당", :kind => daytype).where("arrival_time > #{time}").order("arrival_time asc").first
        route.subway_to_bongcheon = Station.where(:name => station_name, :direction => "봉천", :kind => daytype).where("arrival_time > #{time}").order("arrival_time asc").first
      end
    end
  end

  def find_route(from_stop, to_stop, time_start)
    routes = []
    return routes if from_stop == to_stop
    Edge.where(:from => from_stop.stop_id).each do |from_edge|
      Edge.where(:to => to_stop.stop_id).each do |to_edge|
        if from_edge.line_id == to_edge.line_id
          sr = find_subroute(from_edge.line_id, from_stop, to_stop, time_start)
          if sr
            stops = Edge.get_stop_list(from_edge.line_id, from_stop.stop_id, to_stop.stop_id)
            r = Route.new(from_stop, to_stop, [sr], stops, sr.moving + sr.waiting)
            push_route_without_duplicated(routes, r)
          end
        else
          one_change_routes = []
          edge = from_edge
          while edge do
            edge2 = Edge.find_by(:line_id => to_edge.line_id, :from => edge.to)
            change_stop = Stop.find_by(:stop_id => edge.to)
            break if change_stop == to_stop

            if edge2 && edge2.edge_index <= to_edge.edge_index
              sr1 = find_subroute(from_edge.line_id, from_stop, change_stop, time_start)
	      if sr1
                sr2 = find_subroute(to_edge.line_id, change_stop, to_stop, time_start + sr1.moving + sr1.waiting)
                if sr1 && sr2
                  stops = Edge.get_stop_list(from_edge.line_id, from_stop.stop_id, edge.to)
                  stops += Edge.get_stop_list(to_edge.line_id, edge.to, to_stop.stop_id).drop(1)
                  r = Route.new(from_stop, to_stop, [sr1, sr2], stops, sr1.moving + sr1.waiting + sr2.moving + sr2.waiting)
                  one_change_routes.push(r)
                end
              end
            end
            edge = Edge.find_by(:line_id => edge.line_id, :edge_index => edge.edge_index + 1)
          end
          if not one_change_routes.empty?
            one_change_routes.sort! { |a, b| a.time <=> b.time}
            push_route_without_duplicated(routes, one_change_routes.first)
          end
        end
      end
    end
    routes.sort! { |a, b| a.time <=> b.time}
    return routes
  end

  def last_routes
  end

  private
  def push_route_without_duplicated(routes, route)
    i = routes.index{|x| (x.stops <=> route.stops) == 0}
    if i
      if routes[i].time > route.time
        routes.delete_at(i)
        routes.push(route)
      end
    else
      routes.push(route)
    end
  end
  def find_subroute(line, from_stop, to_stop, time_start)
    time = Edge.get_duration(line, from_stop.stop_id, to_stop.stop_id)
    if time > -1 && time < 3000
      waiting_time = calculate_waiting_time(line, from_stop.stop_id, time_start)
      return SubRoute.new(
        from_stop,
        to_stop,
        Line.find_by(:line_id => line), 
        time, 
        waiting_time)
    else
      return nil
    end
  end
  
  def calculate_waiting_time(line, stop, time_def)
    e = Edge.find_by(:line_id => line, :to => stop)
    if e
      Bus.coming_buses(e).each do |coming|
        pos = Edge.find coming["edge_id"]
        time = coming.time + Edge.get_duration(line, pos.to, stop)
        if time >= time_def
          return time - time_def
        end
      end
      first_edge = Edge.find_by(:line_id => line, :edge_index => 0)
      return Edge.get_duration(line, first_edge.from, stop)
    else
      return 0
    end
  end

  def remove_too_long_routes(routes)
    if routes
      routes.reverse!
      times = Array.new
      routes.each do |route|
        time = 0
        route.subroutes.each do |subroute|
	  time += subroute.moving
	end
	times.push(time)
      end
      times.reverse.each_index do |x|
        ratio = times[x] / times.last
	differ = times[x] - times.last
	if ratio > 2 && differ > 1200
	  routes.delete_at(x)
	end
      end
    end
    routes.reverse!
  end
end

class SubRoute
  attr_reader :from, :to, :line, :moving, :waiting
  def initialize(from, to, line, moving, waiting)
    @from = from
    @to = to
    @line = line
    @moving = moving #moving time
    @waiting = waiting #waiting time
  end
end

class Route
  attr_accessor :from, :to, :subroutes, :stops, :time, :subway_to_sadang, :subway_to_bongcheon
  def initialize(from, to, subroutes, stops, time)
    @from = from
    @to = to
    @subroutes = subroutes
    @stops = stops
    @time = time
    @subway_to_sadang = nil
    @subway_to_bongcheon = nil
  end
end
