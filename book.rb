require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id = Random.rand(1..10_000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def self.count
    ObjectSpace.each_object(self).count
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def destroy
    self.class.instances.delete(self)
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
