class SetupByDay
  attr_reader :day, 
              :buidling,
              :employee_pool, 
              :assigned_employees
              
  def initialize(day, buidling, employee_pool)
    @day = day
    @buidling = buidling
    @employee_pool = employee_pool
    @assigned_employees = []
  end

  def filter_by_availability
    employee_pool.filter_map {|emp| emp if emp.available?(day) }
  end

  def check_buidling_requirements
    if building.type == single_story
      check_single_story_compatibility
    elsif building.type == two_story
      check_two_story_compatibility
    else
      check_commericial_compatibility
    end
  end

  # def check_single_story_compatibility
  #   buidling.requirements 
  # end

  def check_two_story_compatibility
    binding.pry
    filter_by_availability
    buidling.requirements 
  end
end