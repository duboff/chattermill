class Api::V1::ThemesController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def show
    respond_with theme
  end

  private

  def theme
    Theme.find params[:id]
  end
end
