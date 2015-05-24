class RoutesController < ApplicationController
  def show_routes
    if params[:departure] == nil || params[:destination] == nil
      redirect_to :root
      return
    end
    from_stop = Stop.find_by(:stop_id => params[:departure])
    to_stop = Stop.find_by(:stop_id => params[:destination])
    if from_stop == nil || to_stop == nil
      redirect_to :root
      return
    end

    @from = from_stop.name
    @to = to_stop.name
    @routes = [];
    find_route(from_stop, to_stop)
  end

  def find_route(from_stop, to_stop)
    Edge.where(:from => from_stop.stop_id).each do |from_edge|
      Edge.where(:to => to_stop.stop_id).each do |to_edge|
        if from_edge.line_id == to_edge.line_id
          sr = find_subroute(from_edge.line_id, from_stop, to_stop, 0)
          if sr
            stops = Edge.get_stop_list(from_edge.line_id, from_stop.stop_id, to_stop.stop_id)
            r = Route.new(from_stop, to_stop, [sr], stops, sr.moving + sr.waiting)
            push_route_without_duplicated(@routes, r)
          end
        else
          one_change_routes = []
          edge = from_edge
          while edge do
            edge2 = Edge.find_by(:line_id => to_edge.line_id, :from => edge.to)
            change_stop = Stop.find_by(:stop_id => edge.to)
            break if change_stop == to_stop

            if edge2 && edge2.edge_index <= to_edge.edge_index
              sr1 = find_subroute(from_edge.line_id, from_stop, change_stop, 0)
              sr2 = find_subroute(to_edge.line_id, change_stop, to_stop, sr1.moving + sr1.waiting)
              if sr1 && sr2
                stops = Edge.get_stop_list(from_edge.line_id, from_stop.stop_id, edge.to)
                stops += Edge.get_stop_list(to_edge.line_id, edge.to, to_stop.stop_id).drop(1)
                r = Route.new(from_stop, to_stop, [sr1, sr2], stops, sr1.moving + sr1.waiting + sr2.moving + sr2.waiting)
                one_change_routes.push(r)
              end
            end
            edge = Edge.find_by(:line_id => edge.line_id, :edge_index => edge.edge_index + 1)
          end
          if not one_change_routes.empty?
            one_change_routes.sort! { |a, b| a.time <=> b.time}
            push_route_without_duplicated(@routes, one_change_routes.first)
          end
        end
      end
    end
    @routes.sort! { |a, b| a.time <=> b.time}
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
    if time > -1
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
  attr_reader :from, :to, :subroutes, :stops, :time
  def initialize(from, to, subroutes, stops, time)
    @from = from
    @to = to
    @subroutes = subroutes
    @stops = stops
    @time = time
  end
end
