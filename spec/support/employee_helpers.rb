module EmployeeHelpers
  def weekly_availability
    availability = {
      monday: :non_pto,
      tuesday: :non_pto,
      wednesday: :pto,      
      thursday: :pto, 
      friday: :non_pto
    }
    availability.to_a.sample(5).to_h
  end

  def employee_pool_sample
    [
      Employee.new(:certified, weekly_availability),
      Employee.new(:pending_certification, weekly_availability),
      Employee.new(:laborer, weekly_availability),
      Employee.new(:certified, weekly_availability),
      Employee.new(:pending_certification, weekly_availability),
      Employee.new(:laborer, weekly_availability),
      Employee.new(:certified, weekly_availability),
      Employee.new(:pending_certification, weekly_availability),
      Employee.new(:laborer, weekly_availability),
      Employee.new(:certified, weekly_availability),
    ]
  end
end