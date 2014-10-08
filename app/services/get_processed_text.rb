class GetProcessedText
  def self.call(id)
    client = Semantria::Client.new(ENV['SEMANTRIA_KEY'], ENV['SEMANTRIA_SECRET'])
    client.get_document(id)
  end
end
