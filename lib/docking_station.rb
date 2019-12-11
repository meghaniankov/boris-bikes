require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end

  attr_reader :bike_rack, :capacity

  def release_bike
    if @bike_rack.empty?
      raise('No bikes in bike rack')
    else
      @bike_rack.each { |bike| return bike if bike.working? } # return breaks method if working bike is found
      raise('No working bikes in rack') #raise will be called if each loop does not break with Return
    end
  end

  def dock(bike, is_functional = true)
    if full?
      raise('Bike rack is full!')
    end

    if is_functional == false
      bike.broken
    end
    
    @bike_rack << bike
  end

  private

  def full?
    @bike_rack.length == @capacity ? true : false
  end


end
