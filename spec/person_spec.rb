require_relative './spec_helper'

describe Person do
  before :each do
    @person = Person.new(20, 1, 'John')
  end

  it 'should be an instance of Person' do
    expect(@person).to be_an_instance_of Person
  end

  it 'should return the correct age' do
    expect(@person.age).to eql 20
  end

  it 'should return the correct id' do
    expect(@person.id).to eql 1
  end

  it 'should return the correct name' do
    expect(@person.name).to eql 'John'
  end
end
