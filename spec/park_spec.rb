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
      trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)
      trail2 = Trail.new(name: 'Cohab Canyon', length: '1.7 miles', level: :moderate)

      park1.add_trail(trail1)

      expect(park1.trails).to eq([trail1])

      park1.add_trail(trail2)

      expect(park1.trails).to eq([trail1, trail2])
    end
  end
  # trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
end
