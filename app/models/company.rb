class Company < ActiveRecord::Base
  # include Stripe::Customer

  has_many :users

  validates_presence_of :name, :website
  validates_uniqueness_of :name, :website
  # validates :users, presence: true

  # enum plan_id: [:basic, :pro]

  def plan
    Stripe::Plans[plan_id]
  end

  def plan_name
    plan.try :name
  end

  def plan_limit
    plan.try :limit
  end

  def plan_amount
    plan.try :amount
  end

  # returns a Money object which is easy to format properly
  def plan_money
    return nil unless plan_amount
    Money.new(plan_amount, plan.currency)
  end

  def current_usage
    0
  end
end
