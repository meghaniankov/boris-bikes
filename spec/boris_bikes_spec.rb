require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { double :bike }

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    docked_bike = subject.dock(bike)
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'accepts docked bikes' do
    docked_bike = subject.dock(bike)
    expect(docked_bike.empty?).to eq false
  end

  it 'checks how many bikes are available' do
    docked_bike = subject.dock(bike)
    expect(subject.bike_rack).to eq docked_bike.to_a
  end

  it 'if no bikes in rack, raise error' do
    expect {subject.release_bike}.to raise_error('No bikes in bike rack')
  end


  it 'raise error if docking a bike to full docking station with a DEFAULT_CAPACITY' do
    expect {(DockingStation::DEFAULT_CAPACITY + 1).times {subject.dock(bike)}}.to raise_error('Bike rack is full!')
  end

  it 'accepts DEFAULT_CAPACITY docked bikes' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect(subject.bike_rack.length).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'accepts capacity argument' do
    expect(DockingStation.new(25).capacity).to eq 25
  end

  it 'sets capacity to DEFAULT_CAPACITY if no argument is passed' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'raise error if docking a bike to full docking station' do
    cap = 5
    docking_station = DockingStation.new(cap)
    expect {(cap + 1).times {docking_station.dock(bike)}}.to raise_error('Bike rack is full!')
  end
   

  it 'user can report bike as broken when docking bike' do
    allow(bike).to receive(:broken).and_return(true)
    broken_status = false 
    subject.dock(bike, broken_status) 
    allow(bike).to receive(:working?).and_return(false)
    expect(subject.bike_rack[0].working?).to eq false 
  end

  it 'raise error if releasing bike and no working bikes in rack' do
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:broken).and_return(true)
    broken_status = false 
    subject.dock(bike, broken_status)
    expect {subject.release_bike}.to raise_error('No working bikes in rack')
  end
end
