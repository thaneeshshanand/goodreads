# ::RedisInstance = Redis::Namespace.new("goodreads", redis: Redis.new)
module RedisCache
  class << self
    def redis
      @redis ||= Redis::Namespace.new("goodreads", redis: Redis.new)
    end
  end
end