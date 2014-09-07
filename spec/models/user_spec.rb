describe User do

  before(:each) { @user = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Watson') }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:full_name) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end  

  it "#full_name returns the right string" do
    expect(@user.full_name).to match 'John Watson'
  end

end
