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
    full? ? raise('Bike rack is full!') : @bike_rack << bike 
  end

  private

  def full?
    @bike_rack.length == 20 ? true : false
  end


end
