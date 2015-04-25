class StopsController < ApplicationController
  def show
    @results = Array.new
    stop = Stop.find_by stop_id: params[:id]
    Edge.where(end_stop_id: stop.stop_id).find_each do |e|
      coming = Bus.coming_buses(e)[0]
      time = Edge.get_duration(coming.line.line_id, coming.edge.end_stop_id, e.end_stop_id)
      time += coming.time
      @results.push({line: coming.line, time: time})
    end
  end
end
