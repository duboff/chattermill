class Api::V1::ProjectsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def show
    respond_with project
  end

  def create
    # binding.pry
    project = Project.create(project_params)
    respond_with :api, :v1, project
  end

  # def update
  #   respond_with company.update company_params
  #   rescue StripeCustomer::SubscriptionError => e
  #     render json: {error: e.message}, status: 400
  # end

  # def destroy
  #   respond_with company.destroy
  # end

  private

  def project
    Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:name, :body, :company_id)
  end
end
