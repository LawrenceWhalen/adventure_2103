require './lib/trail'

RSpec.describe 'Trail' do
  describe '#initialize' do
    it 'creates a trail instance' do
      trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)

      expect(trail1.class).to eq(Trail)
    end
  end
end
