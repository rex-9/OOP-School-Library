require './classroom'
require './book'
require './person'
require './student'
require './teacher'

class App
  def self.books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def self.persons
    Person.all.map { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def self.createClassroom(label)
    Classroom.new(label)
  end

  def self.createPerson
    print 'Do you want to create a student ( 1 ) or a teacher ( 2 ) ? [ Input the number ] :'
    personType = gets.chomp.to_i
    if personType == 1
      print "Classroom: "
      label = gets.chomp
      classroom = App.createClassroom(label)
      print "Age: "
      age = gets.chomp.to_i
      print "Name: "
      name = gets.chomp
      print "Has parent permission [Y/N]: "
      yn = gets.chomp
      Student.new(age, classroom, name, parent_permission: true) if yn == 'Y' || yn == 'y'
      Student.new(age, classroom, name, parent_permission: false) if yn == 'N' || yn == 'n'
    elsif personType == 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      Teacher.new(age, specialization, name)
    else
      puts 'Please enter a valid number'
      execute(3)
    end
    puts 'Person created successfully'
  end

  def self.createBook
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def self.createRental
    puts 'Select a book from the following list by number'
    #list book with index
    Book.all.map.with_index { |book, index| puts "#{index + 1}, Title: #{book.title}, Author: #{book.author}" }
    bookIndex = gets.chomp.to_i
    book = Book.all[bookIndex - 1]
    puts 'Select a person from the following list by number ( not id )'
    #list person with index
    Person.all.map.with_index { |person, index| puts "#{index + 1}, Name: #{person.name}, Age: #{person.age}" }
    personIndex = gets.chomp.to_i
    person = Person.all[personIndex - 1]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, person, book)
    puts 'Rental created successfully'
  end

  def self.rentalsOfAPerson
    print 'ID of person:'
    id = gets.chomp.to_i
    person = Person.all.select { |x| x.id == id }[0]
    if person
      puts 'Rentals'
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    else
      puts 'Person with the given ID does not exist.'
      puts 'Here are the available persons...'
      self.persons
      puts 'Please try again!'
      self.rentalsOfAPerson
    end
  end
end
