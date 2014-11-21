require 'rails_helper'

describe "Project API" do
  context 'authorized' do

    before do
      project = create(:project_with_company)
      @text = create(:text, project: project)
      @theme = create(:theme, project: project)
      @theme.texts << @text
      @theme.save

      @user = create(:user, company: project.company)
      sign_in_as_a_valid_user
    end

    it 'returns the right theme' do
      get "/api/v1/themes/#{@theme.id}.json"

      expect(response.status).to eq 200

      json = JSON.parse(response.body).with_indifferent_access[:theme]

      expect(json[:body]).to eq @theme.body
      expect(json[:sentiment_score]).to eq @theme.sentiment_score
      expect(json[:text_ids]).to eq [@text.id]
    end
  end 
end
