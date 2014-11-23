class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :body, :sentiment_score, :weight

  has_one :project
  has_many :texts

  def weight
    object.weight
  end
end
