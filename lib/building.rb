require 'pry'
class Building
  attr_reader :type, 
              :requirements,
              :day, 
              :assigned_employees
              
  def initialize(type, day)
    @type = type
    @requirements = buidling_requirements
    @day = day
    @assigned_employees = []
  end

  def buidling_requirements
    requirements = type_conditions
  end

  def single_story_home
    [:certified]
  end

  def two_story_home
    {
      required: [:certified],
      one_of: [:pending_certification, :laborer]
    }
  end

  def commercial
    {
      required: {
        1: [:certified,pending_certification],
        2: [:certified,pending_certification]
      }
      four_of_any: [
        :certified, 
        :pending_certification, 
        :laborer, 
        :certified 
      ]
      # improve if time
    }
  end

  private
  def type_conditions
    if type == :single_story
      return  single_story_home
    elsif type == :two_story
      return two_story_home
    else
      return commercial
    end
  end
end