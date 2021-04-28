require './lib/hiker'
require './lib/park'

RSpec.describe 'Hiker' do
  describe '#initialize' do
    it 'creates an instance of a hiker' do
      hiker1 = Hiker.new('Dora', :moderate)

      expect(hiker1.class).to eq(Hiker)
    end
    it 'contains all starting attributes' do
      hiker1 = Hiker.new('Dora', :moderate)

      expect(hiker1.name).to eq('Dora')
      expect(hiker1.experience_level).to eq(:moderate)
      expect(hiker1.snacks).to eq({})
      expect(hiker1.parks_visited).to eq([])
    end
  end

  describe '#pack' do
    it 'adds a snack name as a key and snack amount as a value' do
      hiker1 = Hiker.new('Dora', :moderate)

      hiker1.pack('water', 1)
      hiker1.pack('trail mix', 3)

      expect(hiker1.snacks).to eq({'water' => 1, 'trail mix' => 3})

      hiker1.pack('water', 1)

      expect(hiker1.snacks).to eq({'water' => 2, 'trail mix' => 3})
    end
  end

  describe '#visit' do
    it 'adds a park to parks_visited' do
      hiker1 = Hiker.new('Dora', :moderate)
      park1 = double('park')
      park2 = double('park')

      hiker1.visit(park1)

      expect(hiker1.parks_visited).to eq([park1])

      hiker1.visit(park2)

      expect(hiker1.parks_visited).to eq([park1, park2])
    end
  end

  describe '#possible_trails' do
    it 'returns all trails from parks visited that match thier level' do
      hiker1 = Hiker.new('Dora', :moderate)
      park1 = double('park')
      park2 = double('park')
      trail2 = double('trail')
      trail3 = double('trail')
      trail4 = double('trail')
      trail6 = double('trail')
      allow(park1).to receive(:trails_of_level) { [trail2, trail3] }
      allow(park2).to receive(:trails_of_level) { [trail4, trail6] }

      hiker1.visit(park1)
      hiker1.visit(park2)

      expect(hiker1.possible_trails).to eq([trail2, trail3, trail4, trail6])
    end
  end

  describe '#favorite_snack' do
    it 'returns the snack the hiker has the most of' do
      hiker1 = Hiker.new('Dora', :moderate)
      hiker1.pack('water', 2)
      hiker1.pack('trail mix', 1)
      hiker1.pack('apple', 4)
      hiker1.pack('carrot', 3)

      expect(hiker1.favorite_snack).to eq('apple')
    end
  end
end
