class Api::V1::UsersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def show
    respond_with user
  end

  private

  def user
    User.find params[:id]
  end

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email)
  # end

end
