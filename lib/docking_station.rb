require_relative 'bike'

class DockingStation
    attr_reader :bike

    def initalize(bikes)
        @bike = bike
    end


  def release_bike
    @bike = Bike.new
    # released_bikes = []
    # released_bikes << release_bike
    # puts "Released Bikes: #{released_bikes}. We have #{released_bikes.count} beautiful bikes!"
  end

    def dock_bike
        docked_bikes = []
        docked_bikes << @bike
        docked_bikes
        # puts "Docked Bikes: #{docked_bikes}. We have #{docked_bikes.count} beautiful bikes docked!"
    end

end
