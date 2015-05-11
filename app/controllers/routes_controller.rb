class RoutesController < ApplicationController
  def show_routes
    lines = Line.all
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
    Edge.where(:from => from_stop).each do |from_edge|
      Edge.where(:to => to_stop).each do |to_edge|
        if from_edge[:line_id] == to_edge[:line_id]
          time = Edge.get_duration(line[:line_id], params[:departure], params[:destination])
          if time > -1
            waiting_time = 0 #TODO: implement calculate waiting
            r = SubRoute.new(
              from = from_stop,
              to = to_stop,
              line = line, moving = time, waiting = waiting_time)
            Route.new(
              from = from_stop, to = to_stop, subroute = [r], time = time + waiting_time)
            @routes.push(r)
          end
        else
         #TODO: implement change line 
        end
      end
    end
  end

  def last_routes
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
  def initialize(from, to, subroutes, time, waiting)
    @from = from
    @to = to
    @soubroutes = subroutes
    @time = time
  end
end
