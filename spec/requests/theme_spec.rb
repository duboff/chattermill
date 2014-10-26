require 'rails_helper'

describe "Project API" do
  context 'authorized' do

    before do
      @theme = create(:theme, text: create(:text))
      @user = create(:user, company: create(:company))
      sign_in_as_a_valid_user
    end

    it 'returns the right theme' do
      get "/api/v1/themes/#{@theme.id}.json"

      expect(response.status).to eq 200

      json = JSON.parse(response.body).with_indifferent_access[:theme]

      expect(json[:body]).to eq @theme.body
      expect(json[:sentiment_score]).to eq @theme.sentiment_score
      expect(json[:sentiment_polarity]).to eq @theme.sentiment_polarity
      expect(json[:text_id]).to eq @theme.text_id
    end
  end 
end
