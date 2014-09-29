require 'rails_helper'

describe "Companies API" do
  describe "GET /company/:id" do
    it "returns redicrect if not authorized" do
      company = create(:company)

      get "/api/v1/companies/#{company.id}"

      expect(response.status).to eq 302
    end

    context 'authorized' do

      before do
        @user = create(:user, company: create(:company))
        sign_in_as_a_valid_user
      end

      it 'returns a company if authorized' do     
        get "/api/v1/companies/#{@user.company_id}.json"

        expect(response.status).to eq 200

        json = JSON.parse(response.body).with_indifferent_access[:company]

        expect(json[:name]).to eq @user.company.name
        expect(json[:website]).to eq @user.company.website
      end

      it 'company json embeds its users' do
        get "/api/v1/companies/#{@user.company_id}.json"
        json = JSON.parse(response.body).with_indifferent_access[:company]

        expect(json[:user_ids]).to eq @user.company.users.map(&:id)
      end

      it 'company json embeds its projects' do
        create(:project, company: @user.company)

        get "/api/v1/companies/#{@user.company_id}.json"
        json = JSON.parse(response.body).with_indifferent_access[:company]

        expect(json[:project_ids]).to eq @user.company.projects.map(&:id)
      end
    end
  end
end