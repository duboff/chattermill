class Api::V1::TextsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def show
    respond_with text
  end

  def index
    respond_with Text.all
  end

  private

  def text
    Text.find params[:id]
  end
end
