class AddIndexToReviewsUserBook < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, [:user_id, :book_id], unique: true
  end
end