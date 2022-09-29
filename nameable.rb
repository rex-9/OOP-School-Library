require './person'

class Nameable
  def correct_name
    raise NotImplementedError.new('You must implement the correct_name method')
  end
end
