class Exe

  def initialize(option)
    @option = option
  end

  def execute
    case @option

    when 1
      puts App.books
      Main.new.initiate

    when 2
      puts App.persons
      Main.new.initiate

    when 3
      App.create_person
      Main.new.initiate

    when 4
      App.create_book
      Main.new.initiate

    when 5
      App.create_rental
      Main.new.initiate

    when 6
      App.rentals_of_a_person
      Main.new.initiate

    when 7
      abort 'See you later! Give us a visit whenever you need something from us'

    else
      puts 'Please enter a valid option'
      Main.new.initiate
    end
  end
end
