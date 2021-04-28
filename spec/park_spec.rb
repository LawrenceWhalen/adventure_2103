require './lib/park'

RSpec.describe 'Park' do
  describe '#initialize' do
    it 'creates an instance of a Park' do
      park1 = Park.new('Capitol Reef')

      expect(park1.class).to eq(Park)
    end
    it 'has all initial attributes' do
      park1 = Park.new('Capitol Reef')

      expect(park1.name).to eq('Capitol Reef')
      expect(park1.trails).to eq([])
    end
  end

  describe '#add_trail' do
    it 'adds a trail instace to the trails array' do
      park1 = Park.new('Capitol Reef')
      trail1 = double ('trail')
      trail2 = double ('trail')

      park1.add_trail(trail1)

      expect(park1.trails).to eq([trail1])

      park1.add_trail(trail2)

      expect(park1.trails).to eq([trail1, trail2])
    end
  end

  describe '#trails_shorter_than' do
    it 'returns a list of all a parks trails shorter than the milage' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')
      trail1 = double('trail')
      allow(trail1).to receive(:float_length) { 2.2 }
      trail2 = double('trail')
      allow(trail2).to receive(:float_length) { 1.7 }
      trail3 = double('trail')
      allow(trail3).to receive(:float_length) { 3.0 }
      trail4 = double('trail')
      allow(trail4).to receive(:float_length) { 2.9 }
      trail5 = double('trail')
      allow(trail5).to receive(:float_length) { 11.0 }
      trail6 = double('trail')
      allow(trail6).to receive(:float_length) { 3.0 }

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(park1.trails_shorter_than(2.5)).to eq([trail1, trail2])
      expect(park2.trails_shorter_than(2.5)).to eq([])
    end
  end

  describe '#hikeable_miles' do
    it 'returns the sum of all trail miles' do
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')
      trail1 = double('trail')
      allow(trail1).to receive(:float_length) { 2.2 }
      trail2 = double('trail')
      allow(trail2).to receive(:float_length) { 1.7 }
      trail3 = double('trail')
      allow(trail3).to receive(:float_length) { 3.0 }
      trail4 = double('trail')
      allow(trail4).to receive(:float_length) { 2.9 }
      trail5 = double('trail')
      allow(trail5).to receive(:float_length) { 11.0 }
      trail6 = double('trail')
      allow(trail6).to receive(:float_length) { 3.0 }

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(park1.hikeable_miles).to eq(6.9)
      expect(park2.hikeable_miles).to eq(16.9)
    end
  end

  describe '#trails_of_level' do
    it 'returns all trails of the given level in the park' do
      park1 = Park.new('Capitol Reef')
      trail1 = double('trail')
      allow(trail1).to receive(:level) { :easy }
      trail2 = double('trail')
      allow(trail2).to receive(:level) { :moderate }
      trail3 = double('trail')
      allow(trail3).to receive(:level) { :moderate }

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)

      expect(park1.trails_of_level(:moderate)).to eq([trail2, trail3])
    end
  end
end
# trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)
# trail2 = Trail.new(name: 'Cohab Canyon', length: '1.7 miles', level: :moderate)
# trail3 = Trail.new(name: 'Tower Bridge', length: '3.0 miles', level: :moderate)
# trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
# trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
# trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
