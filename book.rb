require_relative './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def self.count
    ObjectSpace.each_object(self).count
  end

  def self.all
    JSON.parse(File.read('./books.json'))
  end

  def destroy
    self.class.instances.delete(self)
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
