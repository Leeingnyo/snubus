class BusesController < ApplicationController
  def index
    @lines = Line.all
    @stops = Stop.all
  end

  def all_buses
    Bus.validate
    buses = Hash.new
    Bus.joins(:edge).joins("INNER JOIN lines ON lines.line_id = buses.line_id").select("*, buses.time AS remaining_time").each do |bus|
      buses[bus.name] ||= Array.new
      buses[bus.name].push(:from => bus.from, :to => bus.to,
                           :edge_time => bus.time,
                           :remaining_time => bus.remaining_time)
    end
    render :json => buses
  end
end
