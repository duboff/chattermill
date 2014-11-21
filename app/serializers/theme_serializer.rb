class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :body, :sentiment_score

  has_one :project
  has_many :texts
end
