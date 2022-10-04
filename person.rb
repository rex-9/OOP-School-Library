require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, id = Random.rand(1..10_000), name = 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
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
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    ObjectSpace.each_object(self).count
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
