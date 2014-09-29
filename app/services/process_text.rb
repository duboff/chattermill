class ProcessText
  def self.call(body, uuid)
    client = Semantria::Client.new(ENV['SEMANTRIA_KEY'], ENV['SEMANTRIA_SECRET'])
    client.queue_document(body, uuid)
  end
end