class SemantriaSendWorker
  include Sidekiq::Worker

  def perform(text_body, text_uuid)
    SendTextForAnalysis.call(text_body, text_uuid)
  end
end
