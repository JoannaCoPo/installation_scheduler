class SetupByDay
  attr_reader :results
              
  def initialize
    @results = { }
  end

  def schedule(buildings, employees)
    buildings.each do |building|
      # get available employees for each new building 
      available_employees = filter_by_availability(employees, building)
      check_building_requirements(building, available_employees)

      building.requirements.each do |position|
        # if employee is available on @scheduling_for_day and has the position, assign the employee to the building
          #available_employees.each and check if the employee is available?
          available_employees.each do |emp|
            if emp.type == position
              building.assigned_employees << emp
              available_employees.delete(emp)
            end
          end
          # if available, assign to the building, and I guess the building also needs to know what day of the week it's getting worked on. So building might have another attribute like 'day' that could be set to 'monday'
        # if the employee is not a match, check the next one. If no employees are available, I guess you could either move on to the next building, or on to the next day
      end
    end
  end

  def filter_by_availability(employees, building)
    employees.filter_map {|emp| emp if emp.available?(building.day) }
  end

  def check_building_requirements(building, available_employees)
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:required))
      building.requirements[:required].each do |req|
        available_employees.any? do|emp| 
          if emp.type == req
            building.assigned_employees << emp
            available_employees.delete(emp)
          end 
        end
      end
    end
  end
end
