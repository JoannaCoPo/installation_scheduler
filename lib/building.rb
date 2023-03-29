require 'pry'
class Building
  attr_reader :type, :requirements
              
  def initialize(type)
    @type = type
    @requirements = buidling_requirements
    # @assigned_employees = []
  end

  def buidling_requirements
    requirements = type_conditions
  end

  # def assign(employee)
  #   # if sometthing...
  #   @assigned_employees << emloyee
  # end

  def check_employee_compatibility
    if type == :single_story
      return  [1]
    elsif type == :two_story
      return [1, 2]
    else #any reason to have a more explicit elsif here?
      return [1, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  def required_number_of_employees
    if type == :single_story
      return  [1]
    elsif type == :two_story
      return [1, 2]
    else #any reason to have a more explicit elsif here?
      return [1, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  # if time, maybe reconsider data type for buidling types (hash..)
  def single_story_home
    ["certified_installer"]
  end

  def two_story_home
    pending_cert_or_laborer = "pending certified installer" || "laborer"
    ["certified installer", "#{pending_cert_or_laborer}"]
  end

  def commercial_building
    any_worker = "certified installer" || "pending certified installer" || "laborer"
    [
      "certified installer",
      "certified installer",
      "pending certified installer",
      "pending certified installer", 
      "#{any_worker}"
    ]
  end

  private
  def type_conditions
    if type == :single_story
      return  single_story_home
    elsif type == :two_story
      return two_story_home
    else
      return commercial_building
    end
  end
end