class RatingsAverageJob < ApplicationJob
  queue_as :ratings_average

  def perform(book)
    reviews = Review.where(book_id: book.id)
    rating_avg = (reviews.inject(0) { |sum, review| sum + review.rating }) / reviews.count
    book.update(rating: rating_avg)
  end
end
