describe Text do

  before(:each) { @text = Text.new(body: 'Some body') }

  subject { @text }

  it { should respond_to(:body) }
  it { should respond_to(:uuid) }
  it { should respond_to(:raw_analysis) }

  it { should belong_to(:project) }
  it { should have_many(:theme_relations) }
  it { should have_many(:themes).through(:theme_relations) }
  it { should validate_presence_of(:body) }

  it '#body returns a string' do
    expect(@text.body).to match 'Some body'
  end

  context 'Analysis', sidekiq: :inline do
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

      expect(text.reload.raw_analysis).not_to be_empty
    end
  end

  context 'Themes', sidekiq: :inline do
    it 'themes are created when text analysis is received from Semantria', :vcr do
      text = create(:text)

      text.reload

      expect(text.themes.count).to eq 1
      expect(text.themes.last.body).to eq "great piece"
      expect(text.themes.last.sentiment_score).to eq 0.6
    end
  end
end
