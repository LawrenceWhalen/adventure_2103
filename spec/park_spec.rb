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
      allow(trail1).to receive(:length) do
        '2.2 miles'
      end
      trail2 = double('trial')
      allow(trail1).to receive(:length) do
        '1.7 miles'
      end
      trail3 = double('trail')
      allow(trail1).to receive(:length) do
        '3.0 miles'
      end
      trail4 = double('trail')
      allow(trail1).to receive(:length) do
        '2.9 miles'
      end
      trail5 = double('trail')
      allow(trail1).to receive(:length) do
        '11.0 miles'
      end
      trail6 = double('trail')
      allow(trail1).to receive(:length) do
        '3.0 miles'
      end

      park1.add_trail(trail1)
      park1.add_trail(trail2)
      park1.add_trail(trail3)
      park2.add_trail(trail4)
      park2.add_trail(trail5)
      park2.add_trail(trail6)

      expect(park1.trails_shorter_than(2.5)).to eq([trail1, trial2])
      expect(park2.trails_shorter_than(2.5)).to eq([])
    end
  end
end
# trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)
# trail2 = Trail.new(name: 'Cohab Canyon', length: '1.7 miles', level: :moderate)
# trail3 = Trail.new(name: 'Tower Bridge', length: '3.0 miles', level: :moderate)
# trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
# trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
# trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
