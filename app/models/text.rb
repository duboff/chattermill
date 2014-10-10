class Text < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :body

  after_create :process_text

  def process_text
    SemantriaSendWorker.perform_async(body, uuid)

    SemantriaReceiveWorker.perform_in(10.seconds, uuid)
  end
end
