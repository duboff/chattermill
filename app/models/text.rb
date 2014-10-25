class Text < ActiveRecord::Base
  belongs_to :project

  has_many :themes

  validates_presence_of :body

  after_create :process_text

  def process_text
    SemantriaSendWorker.perform_async(body, uuid)

    SemantriaReceiveWorker.perform_in(10.seconds, uuid)
  end

  def create_themes
    theme_array.each do |theme|
      Theme.create(text: self, body: theme['title'], sentiment_score: theme['sentiment_score'], sentiment_polarity: theme['sentiment_polarity'])
    end
  end

  private

  def theme_array
    raw_analysis["themes"]
  end
end
