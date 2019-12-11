require_relative 'bike'

class DockingStation

  def initialize
    @bike_rack = []
  end

  attr_reader :bike_rack

  def release_bike
   Bike.new
  end

  def dock_bike(bike)
    @bike_rack << bike
  end


end
