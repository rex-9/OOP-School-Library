require_relative './book'
require_relative './person'
require_relative './app'
require_relative './exe'

class Main
  def self.load_data
    books = File.read('./books.json') if File.exist?('./books.json')
    JSON.parse(books).map { |book| Book.new(book['title'], book['author']) }
    people = File.read('./people.json') if File.exist?('./people.json')
    JSON.parse(people).map { |person| Person.new(person['age'], person['id'], person['name']) }
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
