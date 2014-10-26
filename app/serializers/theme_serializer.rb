class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :body, :sentiment_score, :sentiment_polarity

  belongs_to :project
end
