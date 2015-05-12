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
    Edge.where(:from => from_stop.stop_id).each do |from_edge|
      Edge.where(:to => to_stop.stop_id).each do |to_edge|
        print "\n"
        print from_edge
        print "\n"
        print to_edge
        print "\n"
        if from_edge.line_id == to_edge.line_id
          sr = find_subroute(from_edge.line_id, from_stop, to_stop)
          if sr
            r = Route.new(from = from_stop, to = to_stop, subroutes = [sr], time = sr.moving + sr.waiting)
            @routes.push(r)
          end
        else
          one_change_routes = []
          edge = from_edge
          change_stop = Stop.find_by(:stop_id => edge.to)
          while edge do
            edge2 = Edge.find_by(:line_id => to_edge.line_id, :from => edge.to)
            if edge2 && edge2.edge_index <= to_edge.edge_index
              sr1 = find_subroute(from_edge.line_id, from_stop, change_stop)
              sr2 = find_subroute(to_edge.line_id, change_stop, to_stop)
              if sr1 && sr2
                r = Route.new(from_stop, to_stop, [sr1, sr2], sr1.moving + sr1.waiting + sr2.moving + sr2.waiting)
                one_change_routes.push(r)
              end
            end
            edge = Edge.find_by(:line_id => edge.line_id, :edge_index => edge.edge_index + 1)
          end

          if not one_change_routes.empty?
            one_change_routes.sort! { |a, b| a.time <=> b.time}
            @routes.push(one_change_routes.first)
          end
        end
      end
    end
    @routes.sort! { |a, b| a.time <=> b.time}
  end

  def last_routes
  end

  private
  def find_subroute(line, from_stop, to_stop)
    time = Edge.get_duration(line, from_stop.stop_id, to_stop.stop_id)
    if time > -1
      waiting_time = calculate_waiting_time(line, from_stop.stop_id, 0)
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
  attr_reader :from, :to, :subroutes, :time
  def initialize(from, to, subroutes, time)
    @from = from
    @to = to
    @subroutes = subroutes
    @time = time
  end
end
