require './app.rb'

def initiate
  options = 'Please choose an option by enterin a number :
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit'
  puts options
  selectedOption = gets.chomp.to_i
  execute(selectedOption)
end

def execute(option)
  case option

  when 1
    puts App.books
    initiate

  when 2
    puts App.persons
    initiate

  when 3
    puts 'Do you want to create a student ( 1 ) or a teacher ( 2 ) ? [ Input the number ] :'
    personType = gets.chomp.to_i
    if personType == 1
      puts 'Classroom: '
      label = gets.chomp
      classroom = App.createClassroom(label)
      puts 'Age: '
      age = gets.chomp.to_i
      puts 'Name: '
      name = gets.chomp
      puts 'Has parent permission [Y/N]: '
      yn = gets.chomp
      App.createStudent(classroom, age, name, true) if yn == 'Y' || 'y'
      App.createStudent(classroom, age, name, false) if yn == 'N' || 'n'
    if personType == 2
      puts 'Specialization: '
      specialization = gets.chomp
      puts 'Age: '
      age = gets.chomp.to_i
      puts 'Name: '
      name = gets.chomp
      App.createTeacher(specialization, age, name)
    else
      puts 'Please enter a valid number'
      execute(3)
    puts 'Person created successfully'
    initiate

  when 4
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    App.createBook(title, author)
    puts 'Book created successfully'
    initiate

  when 5
    puts 'Select a book from the following list by number'
    #list book with number
    bookNo = gets.chomp.to_i
    puts 'Select a person from the following list by number ( not id )'
    #list person with number
    personNo = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    App.createRental(date, person, book)
    puts 'Rental created successfully'
    initiate

  when 6
    puts 'ID of person: '
    personId = gets.chomp.to_i
    puts 'Rentals'
    puts App.rentalsOfAPerson(personId)
    initiate

  when 7
    exit
    puts 'See you later! Give us a visit whenever you need something from us'

  else
    puts 'Please enter a valid option'
    @@selectedOption = gets.chomp.to_i
  end
end

puts 'Welcome to School Library App'
initiate
