describe Text do

  before(:each) { @text = Text.new(body: 'Some body') }

  subject { @text }

  it { should respond_to(:body) }
  it { should respond_to(:uuid) }
  it { should respond_to(:raw_analysis) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:body) }

  it '#body returns a string' do
    expect(@text.body).to match 'Some body'
  end

  context 'Analysis' do
    it 'sends a text to analysis on creation', :vcr do
      expect(SendTextForAnalysis).to receive(:call).and_call_original

      create(:text)
    end

    it 'attempts to receive the text from analysis after creation', :vcr do
      expect(GetProcessedText).to receive(:call).and_call_original

      create(:text)
    end

    it 'results are stored in a json field', :vcr do
      text = create(:text)

      expect(text.raw_analysis).not_to be_empty
    end
  end
end
