module WishlistsHelper

  def is_wished(book_id)
    puts "********* is wished"
    Wishlist.find_by(user_id: current_user.id, book_id: book_id).nil?
  end

end