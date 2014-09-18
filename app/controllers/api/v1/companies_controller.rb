class Api::V1::CompaniesController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  # def index
  #   respond_with Company.all
  # end

  def show
    respond_with company
  end

  def create
    company = Company.create(company_params)
    # binding.pry
    current_user.tap { |user| user.company = company }.save

    respond_with :api, :v1, company
  end

  def update
    respond_with company.update company_params
    
    rescue StripeCustomer::SubscriptionError => e
      render json: {error: e.message}, status: 400
  end

  # def update
  #   @organization.update_attributes organization_params
  #   respond_with :api, @organization
  # rescue StripeCustomer::SubscriptionError => e
  #   render json: {error: e.message}, status: 400
  # end

  def destroy
    respond_with company.destroy
  end

  private

  def company
    Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(:name, :website, :plan_id)
  end

end