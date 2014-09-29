require 'rails_helper'

describe "Companies API" do
  describe "GET /company/:id" do
    # after(:each) do
    #  Warden.test_reset!
    # end

    it "returns redicrect if not authorized" do
      company = create(:company)

      get "/api/v1/companies/#{company.id}"

      expect(response.status).to eq 302
    end

    it 'returns a company if authorized' do
      @user = create(:user, company: create(:company))

      sign_in_as_a_valid_user
     
      get "/api/v1/companies/#{@user.company_id}.json"

      expect(response.status).to eq 200

      json = JSON.parse(response.body).with_indifferent_access[:company]

      expect(json[:name]).to eq @user.company.name
      expect(json[:website]).to eq @user.company.website
    end
  end
end