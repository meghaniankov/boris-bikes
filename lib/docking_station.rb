require_relative 'bike'

class DockingStation

  def initialize
    @bike_rack = []
  end

  attr_reader :bike_rack

  def release_bike
    @bike_rack.empty? ? raise('No bikes in bike rack') : @bike_rack.pop
  end

  def dock(bike)
    @bike_rack.length < 20 ? @bike_rack << bike : raise('Bike rack is full!')
  end

end
