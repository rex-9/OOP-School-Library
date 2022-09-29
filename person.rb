require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def method_name?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def self.all
    ObjectSpace.each_object(self).all
  end

  def self.count
    ObjectSpace.each_object(self).count
  end

  def add_rental(date, self, book)
    Rental.new(date, self, book)
  end
end
