class Text < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :body

  after_create :process_text

  def process_text
    SendTextForAnalysis.call(body, uuid)

    # sleep(10)

    update(raw_analysis: GetProcessedText.call(uuid).to_json)
  end
end
