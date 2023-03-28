require 'pry'
class Employee
  attr_reader :type,
              :weekly_availability

  def initialize(type, weekly_availability)
    @type = type
    @weekly_availability = weekly_availability
  end

  def available?(weekly_availability, day)
    status = weekly_availability.find {|k, v| k == day }
    # status = nil
    # weekly_availability.each {|key, value| status = value if day == key}
    status[1] == :non_pto ? true : false
  end
end
