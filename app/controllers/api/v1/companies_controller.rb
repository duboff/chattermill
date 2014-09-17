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
    current_user.tap { |user| user.company_id = company.id }.save

    respond_with :api, :v1, company
  end

  def update
    respond_with company.update(company_params)
  end

  def destroy
    respond_with company.destroy
  end

  private

  def company
    Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(:name, :website)
  end

end