class BusesController < ApplicationController
  def index
    @lines = Line.all
    @stops = Stops.all
  end

  def all_buses
    Bus.validate
    buses = Hash.new
    Bus.joins(:edge).joins("INNER JOIN lines ON lines.line_id = buses.line_id").select("*, buses.time AS time").each do |bus|
      buses[bus.name] ||= Array.new
      buses[bus.name].push(:from => bus.from, :to => bus.to, :time => bus.time)
    end
    render :json => buses
  end
end
