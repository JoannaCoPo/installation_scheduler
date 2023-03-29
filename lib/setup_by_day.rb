class SetupByDay
  attr_reader :results
              
  def initialize
    @results = { }
  end

  def schedule(buildings, employees)
    buildings.each do |building|
      available_employees = filter_by_availability(employees, building)
      check_building_requirements(building, available_employees)
    end
  end

  def filter_by_availability(employees, building)
    employees.filter_map {|emp| emp if emp.available?(building.day) }
  end

  def check_building_requirements(building, available_employees)
    #single_story
    if (building.requirements.class != Hash) && (building.assigned_employees.count < 1) # fix this
      building.requirements.each do |position|
        available_employees.each do |emp|
          if emp.type == position
            building.assigned_employees << emp
            available_employees.delete(emp)
          end
        end
      end
    end

    # two_story
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

    # commericial 
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:requirements))
      building.requirements[:requirements].each do |req|
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
