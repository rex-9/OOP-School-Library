require_relative './book'
require_relative './person'
require_relative './app'
require_relative './exe'

class Main
  def self.load_data
    books = File.read('./books.json') if File.exist?('./books.json')
    JSON.parse(books).map { |book| Book.new(book['title'], book['author'], book['id']) } if books
    people = File.read('./people.json') if File.exist?('./people.json')
    JSON.parse(people).map { |person| Person.new(person['age'], person['name'], person['id']) } if people
    rentals = File.read('./rentals.json') if File.exist?('./rentals.json')
    JSON.parse(rentals).map { |rental| Rental.new(rental['date'], Person.all.find { |person| person.id === rental['person']['id'] }, Book.all.find { |book| book.id === rental['book']['id'] },) } if rentals
  end

  def self.initiate
    options = "\nPlease choose an option by enterin a number :
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Save and Exit"

    puts options
    selected_option = gets.chomp.to_i
    Exe.new(selected_option).execute
  end
end

puts 'Welcome to School Library App'
Main.load_data
Main.initiate
