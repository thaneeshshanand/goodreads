module WishlistsHelper

  def is_wished(book_id)
    Wishlist.find_by(user_id: current_user.id, book_id: book_id).nil?
  end

  def wish_count
    prefix = "wish_count2_"
    cache_method_1("#{prefix}#{current_user.id}")

  end

  def cache_method_1(key)
    puts "******** counts called method 1"
    Rails.cache.fetch([key, __method__], expires_in: 2.minutes) do
      puts "********* NOT CACHED METHOD 1"
      Wishlist.where(user_id: current_user.id).count
    end
  end

  def cache_method_2(key)
    puts "******** counts called method 2"
    count = RedisCache.redis.get(key)
    if count.nil?
      puts "********* NOT CACHED METHOD 2"
      count = Wishlist.where(user_id: current_user.id).count
      RedisCache.redis.set(key, count)
    end
    return count
  end

end