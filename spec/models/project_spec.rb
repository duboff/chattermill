describe Project do

  before(:each) { @project = Project.new(name: 'Cool Project', body: 'Bla bla bla') }

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:body) }
  it { should belong_to(:company) }

  it "#name returns a string" do
    expect(@project.name).to match 'Cool Project'
  end  

  it "#body returns the right string" do
    expect(@project.body).to match 'Bla bla bla'
  end
end