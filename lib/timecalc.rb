# frozen_string_literal: true

class TimeCalc
  def self.calculate(formula)
    new(formula).calculate
  end

  def initialize(formula)
    @formula = formula
  end
  private_class_method :new

  def calculate
    total = formula.map { |timestamp| time_in_minutes(timestamp) }.sum
    puts total_to_hours_and_minutes(total)
  end

private

  attr_reader :formula

  def time_in_minutes(timestamp)
    hours_and_minutes = timestamp.split(':').map(&:to_i)
    (hours_and_minutes[0] * 60) + hours_and_minutes[1]
  end

  def total_to_hours_and_minutes(total)
    if total > 60
      hours = total / 60
      minutes = total - (hours * 60)
      "#{hours}:#{minutes}"
    else
      "0:#{total}"
    end
  end
end
