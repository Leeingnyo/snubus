class StopsController < ApplicationController
  def show
    @results = Array.new
    stop = Stop.find_by :stop_id => params[:id]
    Edge.where(:to => stop.stop_id).find_each do |e|
      coming = Bus.coming_buses(e)[0]
      if coming != nil
        pos = Edge.find coming["edge_id"]
        time = Edge.get_duration(coming["line_id"], pos.to, e.to)
        time += coming["time"]
        @results.push({:line => Line.find_by(:line_id => coming["line_id"]).name, :time => time})
      end
    end
  end
end
