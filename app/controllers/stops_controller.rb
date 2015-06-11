class StopsController < ApplicationController
  def show
    @results = Array.new
    @stop = Stop.find_by(:stop_id => params[:id])
    if @stop
      Edge.where(:to => @stop.stop_id).find_each do |target_edge|
        if target_edge.line_id == "walk"
	  next
	end
        bus = Bus.coming_buses(target_edge).first
        if(bus.nil?)
          next
        end

        current_edge = bus.edge
        line = Line.find_by(:line_id => target_edge.line_id)
        remaining_time = Edge.get_duration(line.line_id, current_edge.to,
                                           @stop.stop_id)
        remaining_time += bus.time

        @results.push(:line => line.name,
                      :time => remaining_time,
                      :from => Stop.find_by(:stop_id => current_edge.from).name,
                      :left => target_edge.edge_index - current_edge.edge_index)
      end
    else
      redirect_to :root
    end
  end
end
