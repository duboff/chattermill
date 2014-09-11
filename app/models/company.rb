class Company < ActiveRecord::Base
  has_many :users
  has_one :plan

  validates_presence_of :name, :website
  validates_uniqueness_of :name, :website
  # validates :users, presence: true
end
