# rubocop:disable Metrics

class Exe
  def initialize(option)
    @option = option
  end

  def execute
    case @option

    when 1
      puts App.books
      Main.initiate

    when 2
      puts App.persons
      Main.initiate

    when 3
      App.create_person
      Main.initiate

    when 4
      App.create_book
      Main.initiate

    when 5
      App.create_rental
      Main.initiate

    when 6
      App.rentals_of_a_person
      Main.initiate

    when 7
      App.save
      abort 'See you later! Give us a visit whenever you need something from us'

    else
      puts 'Please enter a valid option'
      Main.initiate
    end
  end
end
# rubocop:enable Metrics
