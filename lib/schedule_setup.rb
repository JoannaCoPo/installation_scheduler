class ScheduleSetup
  attr_reader :results
              
  def initialize
    @results = { }
  end

  def schedule(buildings, employees)
     compatibility_check = buildings.each do |building|
      available_employees = filter_by_availability(employees, building)
      check_strict_building_requirements(building, available_employees)
      check_flexible_building_requirements(building, available_employees)
    end
    results[:week] = compatibility_check
  end

  def filter_by_availability(employees, building)
    employees.filter_map {|emp| emp if emp.available?(building.day) }
  end

  def check_strict_building_requirements(building, available_employees)
    # single_story, 1 certified
    if building.requirements.class != Hash 
      building.requirements.each do |position|
        available_employees.each do |emp|
          if emp.type == position
            if building.assigned_employees.empty?
              building.assigned_employees << emp
              available_employees.delete(emp)
            end
          end
        end
      end
    end

    # two_story, 1 certified
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:required))
      building.requirements[:required].each do |req|
        available_employees.any? do|emp| 
          if emp.type == req
            if building.assigned_employees.empty?
              building.assigned_employees << emp
              available_employees.delete(emp)
            end
          end 
        end
      end
    end

    # commericial, 2 certified and 2 pending cert 
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:requirements))
      building.requirements[:requirements].each do |key, req_array|
        req_array.each do |req|
          available_employees.any? do|emp| # maybe change to each
            if emp.type == req
              if building.assigned_employees.count < 4
                building.assigned_employees << emp
                available_employees.delete(emp)
              end
            end 
          end
        end
      end
    end
  end

  def check_flexible_building_requirements(building, available_employees)
    # two_story
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:one_of))
      building.requirements[:one_of].each do |req|
        available_employees.any? do|emp|
          # binding.pry
          if emp.type == req
            if building.assigned_employees.count < 2
              building.assigned_employees << emp
              available_employees.delete(emp)
            end
          end 
        end
      end
    end

    # commercial
    if (building.requirements.class == Hash) && (building.requirements.has_key?(:four_of_any))
      building.requirements[:four_of_any].each do |req|
        available_employees.any? do|emp|
          if emp.type == req
            if building.assigned_employees.count < 8
              building.assigned_employees << emp
              available_employees.delete(emp)
            end
          end 
        end
      end
    end
  end
end
