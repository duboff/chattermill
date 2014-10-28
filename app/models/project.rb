class Project < ActiveRecord::Base
  belongs_to :company
  has_many :texts
  has_many :themes, through: :texts

  validates_presence_of :name, :body

  after_create :create_texts

  def sentiment_score
    (themes.map(&:sentiment_score).inject(&:+) / themes.count).round(2)
  end

  private

  def create_texts
    body.split("\n").each do |para|
      Text.create(body: para, uuid: SecureRandom.uuid, project_id: id)
    end
  end
end
