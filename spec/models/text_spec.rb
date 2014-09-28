describe Text do

  before(:each) { @text = Text.new(body: "Some body") }

  subject { @text }

  it { should respond_to(:body) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:body) }
  
  it "#body returns a string" do
    expect(@text.body).to match "Some body"
  end  
end
