class Employee
  attr_reader :type,
              :weekly_availability

  def initialize(type, weekly_availability)
    @type = type
    @weekly_availability = weekly_availability
  end

  def available?(day)
    status = weekly_availability.find {|k, v| k.to_s == day }
    status[1] == :non_pto ? true : false
  end
end
