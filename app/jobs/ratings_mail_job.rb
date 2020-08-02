class RatingsMailJob < ApplicationJob
  queue_as :ratings_mail

  def perform(book, review)
    wished_users = Wishlist.where(book_id: book.id).map { |wishlist| wishlist.user }
    wished_users.each do |user|
      if (user.email == 'thaneeshshanand@gmail.com')
        BookMailer.book_rating(user, book, review).deliver
      end
    end
  end
end
