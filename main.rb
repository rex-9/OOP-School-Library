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
    App.createPerson
    initiate

  when 4
    App.createBook
    initiate


  when 5
    App.createRental
    initiate

  when 6
    App.rentalsOfAPerson
    initiate

  when 7
    abort 'See you later! Give us a visit whenever you need something from us'

  else
    puts 'Please enter a valid option'
    initiate
  end
end

puts 'Welcome to School Library App'
initiate
