class MongoWorker
  include Sidekiq::Worker

  def perform(word, timestamp)
    Tile.create(word: word, timestamp: timestamp)
  end
end