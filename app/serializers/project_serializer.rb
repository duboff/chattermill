class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :sentiment_score

  has_one :company
  has_many :texts
  has_many :themes

end
