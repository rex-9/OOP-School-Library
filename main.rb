require_relative './app'
require_relative './exe'

class Main
  def initiate
    options = "\nPlease choose an option by enterin a number :
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
    puts options
    selected_option = gets.chomp.to_i
    Exe.new(selected_option).execute
  end
end

puts 'Welcome to School Library App'
Main.new.initiate
