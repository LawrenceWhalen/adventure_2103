require './lib/park'

RSpec.describe 'Park' do
  describe '#initialize' do
    it 'creates an instance of a Park' do
      park1 = Park.new('Capitol Reef')

      expect(park1.class).to eq(Park)
    end
  end
end
