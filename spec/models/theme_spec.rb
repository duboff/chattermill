describe Theme do

  before(:each) { @theme = Theme.new(body: 'Some body', sentiment_score: 0.75, sentiment_polarity: "positive") }

  subject { @theme }

  it { should respond_to(:body) }
  it { should respond_to(:sentiment_score) }
  it { should respond_to(:sentiment_polarity) }

  it { should belong_to(:text) }
  it { should belong_to(:project) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:sentiment_score) }
  it { should validate_presence_of(:sentiment_polarity) }

  it '#body returns a string' do
    expect(@theme.body).to match 'Some body'
  end
end