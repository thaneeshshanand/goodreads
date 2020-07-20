class Book < ApplicationRecord
  belongs_to :author
  validates :name, presence: true, length: { maximum: 50 }
  validates :author_id, presence: true
end