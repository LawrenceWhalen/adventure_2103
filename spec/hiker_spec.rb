require './lib/hiker'

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
    end
  end
  describe '#pack' do
    it 'adds a snack name as a key and snack amount as a value' do
      hiker1 = Hiker.new('Dora', :moderate)

      hiker1.pack('water', 1)
      hiker1.pack('trial mix', 3)

      expect(hiker1.snacks).to eq({'water' => 1, 'trail mix' => 3})

      hiker.pack('water', 1)

      expect(hiker1.snacks).to eq({'water' => 2, 'trail mix' => 3})
    end
  end
end
