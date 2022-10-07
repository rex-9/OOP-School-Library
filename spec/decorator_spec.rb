require_relative('spec_helper')

describe BaseDecorator do
  before(:each) do
    @base_decorator = BaseDecorator.new('Oyinlade')
  end

  it 'Create BaseDecorator with nameable' do
    expect(@base_decorator).to be_an_instance_of(BaseDecorator)
  end
end

describe CapitalizeDecorator do
  before(:each) do
    @capitalize_decorator = CapitalizeDecorator.new('Nicolas')
  end

  it 'Create capitalize_decorator with nameable' do
    expect(@capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
  end
end

describe TrimmerDecorator do
  before(:each) do
    @trimmer_decorator = TrimmerDecorator.new('Piesie')
  end

  it 'Create trimmer_decorator with nameable' do
    expect(@trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
  end
end
