require "./spec/support/employee_helpers"
require "./lib/setup_by_day"
require "./lib/building"
require "./lib/employee"
require 'pry'

RSpec.configure do |c|
  c.include EmployeeHelpers
end

RSpec.describe SetupByDay do
  monday = Building.new(:single_story, 'monday')
  tuesday = Building.new(:two_story, 'tuesday')
  wednesday = Building.new(:commericial, 'wednesday')
  thursday = Building.new(:single_story, 'thursday')
  friday = Building.new(:two_story, 'friday')
  buildings = [monday, tuesday, wednesday, thursday, friday]
    
    
  #check_strict_building_requirements
  xit 'returns the strict buidling requirements' do
    setup = SetupByDay.new
      
    expect(monday.assigned_employees.count).to eq(0)
    expect(tuesday.assigned_employees.count).to eq(0)
    expect(wednesday.assigned_employees.count).to eq(0)

    # would need to test specific helper method vs #schedule
    setup.schedule(buildings, employee_pool_sample)

    expect(monday.assigned_employees.count).to eq(1)
    expect(tuesday.assigned_employees.count).to eq(1)
    expect(wednesday.assigned_employees.count).to eq(4)
  end

  #check_flexible_building_requirements
  it 'returns the strict buidling requirements' do
    setup = SetupByDay.new
      
    expect(monday.assigned_employees.count).to eq(0)
    expect(tuesday.assigned_employees.count).to eq(0)
    expect(wednesday.assigned_employees.count).to eq(0)

    setup.schedule(buildings, employee_pool_sample)

    expect(monday.assigned_employees.count).to eq(1)
    expect(tuesday.assigned_employees.count).to eq(2)
    expect(wednesday.assigned_employees.count).to eq(8)
  end

  it 'returns the strict buidling requirements' do
    setup = SetupByDay.new
    expect(setup.results).to eq({})
    
    setup.schedule(buildings, employee_pool_sample)
    
    expect(setup.results.class).to eq(Hash)
    expect(setup.results[:week].size).to eq(5)
  end
end

# would be neat to add error or alert if there are not enough 
# compatible employees for a given day/building