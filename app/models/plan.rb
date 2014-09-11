class Plan < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
