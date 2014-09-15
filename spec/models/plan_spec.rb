require 'rails_helper'

describe Plan do
  before(:each) { @plan = Plan.new(name: 'Gold', description: 'This is our super amazing plan', price: 100) }

  subject { @plan }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }

  it { should have_many(:companies) }

  it { should validate_presence_of :name}
  it { should validate_presence_of :description}
  it { should validate_presence_of :price}

  it "#name returns a string" do
    expect(@plan.name).to match 'Gold'
  end  

  it "#full_name returns the right string" do
    expect(@plan.description).to match 'This is our super amazing plan'
  end
end
