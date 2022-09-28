require './person'

class Teacher < Person
  def initialize(age, name = 'Unknown', parent_permission: true, specialization)
    super(age, name = 'Unknown', parent_permission: true, specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
