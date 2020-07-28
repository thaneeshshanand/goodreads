class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
