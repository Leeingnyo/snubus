class RoutesController < ApplicationController
  def show_routes
    lines = Line.all
    if fromstop = Stop.find_by(:stop_id => params[:departure])
      @from = fromstop.name
    else
      redirect_to :root
    end
    if tostop = Stop.find_by(:stop_id => params[:destination])
      @to = tostop.name
    else
      redirect_to :root
    end
    @routes = [];
    lines.each do |line|
      time = Edge.get_duration(line[:line_id], params[:departure], params[:destination])
      if time > -1
        r = SubRoute.new(
          from = Stop.find_by(:stop_id => params[:departure]),
          to = Stop.find_by(:stop_id => params[:destination]),
          line = line, moving = time, waiting = 0)
        @routes.push(r)
      end
    end
  end
end

class SubRoute
  attr_reader :from, :to, :line, :moving, :waiting
  def initialize(from, to, line, moving, waiting)
    @from = from
    @to = to
    @line = line
    @moving = moving
    @waiting = waiting
  end
end