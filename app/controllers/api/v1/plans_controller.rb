class Api::V1::PlansController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def index
    plans = Stripe::Plans.all.map do |plan|
      PlanSerializer.new(plan, root: false)
    end
    respond_with plans
  end

  def show
    plan = Stripe::Plans.all.detect do |plan|
      plan.id.to_s == params[:id]
    end

    respond_with PlanSerializer.new(plan)
  end
end
