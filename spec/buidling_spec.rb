require "./lib/building"

RSpec.describe Building do
  describe '#initialize' do
    single_story = Building.new(:single_story, 'monday')

    it 'returns building type' do
      expect(single_story.type).to eq(:single_story)
    end

    it 'returns requirements per buidling type' do
      expect(single_story.requirements).to eq([:certified])
      two_story = Building.new(:two_story_home, 'tuesday')
    #   binding.pry
      expect(two_story.requirements).to eq({
        requirements:{
          1=>[:certified, :pending_certification], 
          2=>[:certified, :pending_certification]
        },
        four_of_any: [:certified, :pending_certification, :laborer, :certified]
        })
    end
  end

  describe '#available?' do
    xit 'returns employee availability per day' do
      # would need to backfill this test
    end
  end
end