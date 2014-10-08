require 'rails_helper'

describe "Project API" do
  describe "GET /projects/:id" do
    it "returns redicrect if not authorized" do
      allow_any_instance_of(Text).to receive(:process_text).and_return true
      project = create(:project)

      get "/api/v1/projects/#{project.id}"

      expect(response.status).to eq 302
    end

    context 'authorized' do

      before do
        allow_any_instance_of(Text).to receive(:process_text).and_return true
        @user = create(:user, company: create(:company))
        sign_in_as_a_valid_user
        @project = create(:project, company: @user.company)
      end

      it 'returns a company if authorized' do
        get "/api/v1/projects/#{@project.id}.json"

        expect(response.status).to eq 200

        json = JSON.parse(response.body).with_indifferent_access[:project]

        expect(json[:name]).to eq @project.name
        expect(json[:body]).to eq @project.body
      end

    end
  end
  describe "POST /projects" do

    it 'creates a project from correct params' do
      allow_any_instance_of(Text).to receive(:process_text).and_return true

      @user = create(:user, company: create(:company))
      sign_in_as_a_valid_user

      project_params = {
        "project" => {
          "name" => "Bla",
          "body" => "Some Body",
          "company_id" => @user.company.id
        }
      }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/api/v1/projects", project_params, request_headers

      expect(response.status).to eq 201
      expect(Project.count).to eq 1
      expect(Project.last.name).to eq 'Bla'
      expect(Project.last.body).to eq 'Some Body'
      expect(Project.last.company).to eq @user.company
    end
  end
end
