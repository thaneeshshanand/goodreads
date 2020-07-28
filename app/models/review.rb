class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6}

  paginates_per 5
end
