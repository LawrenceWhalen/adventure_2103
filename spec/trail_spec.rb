require './lib/trail'

RSpec.describe 'Trail' do
  describe '#initialize' do
    it 'creates a trail instance' do
      trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)

      expect(trail1.class).to eq(Trail)
    end
    it 'has the passed attributes' do
      trail1 = Trail.new(name: 'Grand Wash', length: '2.2 miles', level: :easy)

      expect(trail1.name).to eq('Grand Wash')
      expect(trail1.length).to eq('2.2 miles')
      expect(trail1.level).to eq(:easy)
    end
  end
end
