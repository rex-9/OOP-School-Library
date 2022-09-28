class Person

  def initialize(name = 'Unknown', age, parent_permission = true)
    @id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    @is_of_age? || @parent_permission
  end

  def is_of_age?
    @age >= 18
  end

end

class Student

end

class Teacher

end
