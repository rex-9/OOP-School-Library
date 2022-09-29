require './classroom'
require './book'
require './person'
require './student'
require './teacher'

class App
  def self.books
    Book.all.map { |book| book.title }
  end

  def self.persons
    Person.all.map { |person| person.name }
  end

  def self.createClassroom(label)
    Classroom.new(label)
  end

  def self.createStudent(age, name, parent_permission)
    Student.new(age, name, parent_permission)
  end

  def self.createTeacher(age, name, parent_permission)
    Teacher.new(age, name, parent_permission)
  end

  def self.createBook(title, author)
    Book.new(title, author)
  end

  def self.createRental(date, person, book)
    Rental.new(date, person, book)
  end

  def self.rentalsOfAPerson(id)
    Rental.all.select { |rental| rental.person.id == id }
  end
end
