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
        allow_any_instance_of(Text).to receive(:process_text).and_return true

        create(:project, company: @user.company)

        get "/api/v1/companies/#{@user.company_id}.json"
        json = JSON.parse(response.body).with_indifferent_access[:company]

        expect(json[:project_ids]).to eq @user.company.projects.map(&:id)
      end
    end
  end

  describe "POST /companies" do
    it 'creates a company from correct params' do
      sign_in_as_a_valid_user

      company_params = {
        "company" => {
          "name" => "Bla",
          "website" => "blabla.com",
        }
      }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/api/v1/companies", company_params, request_headers

      expect(response.status).to eq 201
      expect(Company.count).to eq 1
      expect(Company.last.name).to eq 'Bla'
      expect(Company.last.website).to eq 'blabla.com'
    end
  end

  describe 'PUT /companies/:id' do
    it 'updates the subscription plan' do
      @user = create(:user, company: create(:company))
      sign_in_as_a_valid_user

      company_params = {
        "company" => {
          "name" => "Bla",
          "website" => "blabla.com",
          "plan_id" => "basic"
        },
        "id" => @user.company_id.to_s
      }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      put "/api/v1/companies/#{@user.company_id}", company_params, request_headers

      expect(response.status).to eq 204
    end
  end
end