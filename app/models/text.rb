class Text < ActiveRecord::Base
  belongs_to :project

  has_many :theme_relations
  has_many :themes, through: :theme_relations

  validates_presence_of :body

  after_create :process_text

  def process_text
    SemantriaSendWorker.perform_async(body, uuid)

    SemantriaReceiveWorker.perform_in(10.seconds, uuid)
  end

  def create_themes
    theme_array.each do |theme|
      theme_body = theme['title'].downcase
      t = Theme.find_or_create_by(body: theme_body, project_id: project_id) do |t|
        t.sentiment_score = theme['sentiment_score']
      end

      themes << t
    end
  end

  private

  def theme_array
    raw_analysis["themes"]
  end
end
