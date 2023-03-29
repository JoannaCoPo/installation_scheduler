require "./spec/support/employee_helpers"
require "./lib/setup_by_day"
require "./lib/building"
require "./lib/employee"
require 'pry'

RSpec.configure do |c|
  c.include EmployeeHelpers
end

RSpec.describe SetupByDay do
  describe '#initialize' do
    single_story = Building.new(:single_story)

    it 'returns which day' do
      setup = SetupByDay.new('monday', single_story, employee_pool_sample)
      expect(setup.day).to eq('monday')
    end

    it 'returns the assigned builing type for the day' do
      setup = SetupByDay.new('monday', single_story, employee_pool_sample)
      expect(setup.buidling).to eq(single_story)
    end

    it 'has access to all employees' do
      setup = SetupByDay.new('monday', single_story, employee_pool_sample)
      # employee_pool_sample has randomized values for employee availability
      expect(setup.employee_pool.count).to eq(10)
    end
  end

  describe '#check_employee_availability?' do
    two_story = Building.new(:two_story)
    # first to narrow down options
    xit 'removes unavaiable employees from pool' do
      setup = SetupByDay.new('monday', two_story, employee_pool_sample) 
      expect(setup.filter_by_availability).to eq(true)
    end
  end

  describe '#check_buidling_requirements?' do
    two_story = Building.new(:two_story)
    it 'returns employee availability per day' do
      setup = SetupByDay.new('monday', two_story, employee_pool_sample)  
      expect(setup.check_two_story_compatibility).to eq(true)
    end
  end
end

# would be neat to add error or alert if there are not enough 
# empployees for a given day