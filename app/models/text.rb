class Text < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :body

  after_create :process_text

  def process_text
    ProcessText.call(body, uuid)
  end
end
