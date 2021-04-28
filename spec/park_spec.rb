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
end
