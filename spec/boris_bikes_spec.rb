require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    docked_bike = subject.dock_bike(bike)
    # expect(bike).to be_working
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'accepts docked bikes' do
    bike = Bike.new
    docked_bike = subject.dock_bike(bike)
    expect(docked_bike.empty?).to eq false
  end

#   it 'checks how many bikes are available' do
#     bike = subject.release_bike
#     docked_bike = subject.dock_bike(bike)
#     expect(subject.check_bikes_available).to eq "There are 1 bike(s) available"
#   end

  it 'checks how many bikes are available' do
    bike = Bike.new
    docked_bike = subject.dock_bike(bike)
    expect(subject.bike_rack).to eq docked_bike.to_a
  end

  it 'if no bikes in rack, raise error' do
    expect {subject.release_bike}.to raise_error
  end


end
