class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :body, :sentiment_score, :sentiment_polarity, :project_id

  # belongs_to :project

  def project_id
    object.project.id
  end
end