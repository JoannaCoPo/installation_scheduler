require "./lib/building"

RSpec.describe Building do
#   before(:each) do 
#     @building = Building.new(:single_story)
#   end
  describe '#initialize' do
    single_story = Building.new(:single_story)

    it 'returns building type' do
      expect(single_story.type).to eq(:single_story)
    end

    it 'returns requirements per buidling type' do
      expect(single_story.requirements).to eq(["certified_installer"])
      two_story = Building.new(:two_story_home)
      expect(two_story.requirements).to eq(["certified_installer"])
    end
  end

  describe '#available?' do
    xit 'returns employee availability per day' do
      # day = Day.new('Tuesday') 
      tuesday = :tuesday
      expect(@employee.available?(@weekly_availability, tuesday)).to eq(true)
    end
  end

  private
end