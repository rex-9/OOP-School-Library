require_relative './classroom'
require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require 'json'

class App
  def self.books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def self.persons
    Person.all.map { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def self.create_classroom(label)
    Classroom.new(label)
  end

  def self.create_person
    print 'Do you want to create a student ( 1 ) or a teacher ( 2 ) ? [ Input the number ] :'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission [Y/N]: '
      yn = gets.chomp
      Student.new(age, name, parent_permission: true) if %w[Y y].include?(yn)
      Student.new(age, name, parent_permission: false) if %w[N n].include?(yn)
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      Teacher.new(age, name)
    else
      puts 'Please enter a valid number'
      execute(3)
    end
    puts 'Person created successfully'
  end

  def self.create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def self.create_rental
    puts 'Select a book from the following list by number'
    # list book with index
    Book.all.map.with_index { |book, index| puts "#{index + 1}, Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    book = Book.all[book_index - 1]
    puts 'Select a person from the following list by number ( not id )'
    # list person with index
    Person.all.map.with_index { |person, index| puts "#{index + 1}, Name: #{person.name}, Age: #{person.age}" }
    person_index = gets.chomp.to_i
    person = Person.all[person_index - 1]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, person, book)
    puts 'Rental created successfully'
  end

  def self.rentals_of_a_person
    print "\nID of person:"
    id = gets.chomp.to_i
    person = Person.all.select { |x| x.id == id }[0]
    if person
      puts 'Rentals'
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    else
      puts 'Person with the given ID does not exist.'
      puts 'Here are the available persons...'
      persons
      puts 'Please try again!'
      rentals_of_a_person
    end
  end

  def self.save
    puts books = Book.all.map { |book| { title: book.title, author: book.author } }.to_a.to_json
    puts rentals = Person.all.map do |person|
      person.rentals.map do |rental|
        { date: rental.date, book: { title: rental.book.title, author: rental.book.author } }
      end.to_a.to_json
    end
    # rentals.map { |rental| rentals = rental if rental.count == 0 }
    puts people = Person.all.map.with_index do |person, index|
      { id: person.id, age: person.age, name: person.name, rentals: JSON.parse(rentals[index]) }
    end.to_a.to_json
    saved_books = File.open('books.json', 'w')
    saved_people = File.open('people.json', 'w')
    saved_books.write(books)
    saved_people.write(people)
    puts 'Saved successfully'
  end
end
