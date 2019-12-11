require_relative 'bike'

class DockingStation

  def initialize
    @bike_rack = []
  end

  attr_reader :bike_rack

  def release_bike
    if @bike_rack.empty?
      raise 'No bikes in bike rack'
    else
      @bike_rack.pop
    end
  end



  def dock_bike(bike)
    @bike_rack << bike
  end


end
