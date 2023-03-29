module EmployeeHelpers
  def weekly_availability_1
    availability = {
      monday: :non_pto,
      tuesday: :non_pto,
      wednesday: :non_pto,      
      thursday: :pto, 
      friday: :non_pto
    }
    # availability.to_a.sample(5).to_h
  end

  def weekly_availability_2
    availability = {
      monday: :pto,
      tuesday: :non_pto,
      wednesday: :pto,      
      thursday: :pto, 
      friday: :non_pto
    }
    # availability.to_a.sample(5).to_h
  end

  def employee_pool_sample
    [
      Employee.new(:certified, weekly_availability_1),
      Employee.new(:pending_certification, weekly_availability_1),
      Employee.new(:laborer, weekly_availability_1),
      Employee.new(:certified, weekly_availability_1),
      Employee.new(:pending_certification, weekly_availability_1),
      Employee.new(:laborer, weekly_availability_1),
      Employee.new(:certified, weekly_availability_1),
      Employee.new(:pending_certification, weekly_availability_1),
      Employee.new(:laborer, weekly_availability_1),
      Employee.new(:certified, weekly_availability_1),
      Employee.new(:pending_certification, weekly_availability_1),
      Employee.new(:laborer, weekly_availability_1),
      Employee.new(:certified, weekly_availability_1),
      Employee.new(:laborer, weekly_availability_2),
      Employee.new(:certified, weekly_availability_2),
      Employee.new(:pending_certification, weekly_availability_2),
      Employee.new(:laborer, weekly_availability_2),
      Employee.new(:certified, weekly_availability_2),
    ]
  end
end