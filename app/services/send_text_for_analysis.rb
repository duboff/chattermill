class SendTextForAnalysis
  def self.call(text, id)
    client = Semantria::Client.new(ENV['SEMANTRIA_KEY'], ENV['SEMANTRIA_SECRET'])
    client.queue_document(text, id)
  end
end
