require './nameable'

class BaseDecorator
  def initialize
    @nameable = Nameable.new
  end

  def correct_name
    @nameable.correct_name
  end
end
