require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end

  attr_reader :bike_rack, :capacity

  def release_bike
    @bike_rack.empty? ? raise('No bikes in bike rack') : @bike_rack.pop
  end

  def dock(bike)
    full? ? raise('Bike rack is full!') : @bike_rack << bike
  end

  private

  def full?
    @bike_rack.length == @capacity ? true : false
  end


end
