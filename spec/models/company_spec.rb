describe Company do

  before(:each) { @co = Company.new(name: 'Acme Inc', website: 'http://acme.org') }

  subject { @co }

  it { should respond_to(:name) }
  it { should respond_to(:website) }
  it { should have_many(:users) }

  it { should validate_presence_of :name}
  it { should validate_presence_of :website}
  it { should validate_uniqueness_of :name}
  it { should validate_uniqueness_of :website}

  it "#name returns a string" do
    expect(@co.name).to match 'Acme Inc'
  end  

  it "#website returns the right string" do
    expect(@co.website).to match 'http://acme.org'
  end

  context 'Subscription' do
    it 'know things about the subscription plan' do
      @co.plan_id = "pro"

      @co.save

      expect(@co.plan_name).to eq 'Pro'
      expect(@co.plan_limit).to eq 5
      expect(@co.plan_amount).to eq 10000
      expect(@co.plan_money).to eq Money.new(10000, 'USD')
    end
    
    it 'usage starts with zero' do
      expect(@co.current_usage).to eq 0
    end
  end
end