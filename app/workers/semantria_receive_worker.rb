class SemantriaReceiveWorker
  include Sidekiq::Worker

  def perform(uuid)
    text = Text.find_by_uuid(uuid)
    text.update(raw_analysis: GetProcessedText.call(uuid).to_json)
  end
end
