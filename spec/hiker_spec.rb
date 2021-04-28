require './lib/hiker'

RSpec.describe 'Hiker' do
  describe '#initialize' do
    it 'creates an instance of a hiker' do
      hiker1 = Hiker.new('Dora', :moderate)

      expect(hiker1.class).to eq(Hiker)
    end
  end
end
