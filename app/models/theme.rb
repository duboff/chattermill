class Theme < ActiveRecord::Base
  has_many :theme_relations
  has_many :texts, through: :theme_relations

  belongs_to :project

  validates_presence_of :body, :sentiment_score
end
