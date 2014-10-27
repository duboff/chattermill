class Theme < ActiveRecord::Base
  belongs_to :text

  delegate :project, to: :text, allow_nil: true

  validates_presence_of :body, :sentiment_score, :sentiment_polarity
end
