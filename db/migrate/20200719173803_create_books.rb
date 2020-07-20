class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :name
      t.text :description
      t.integer :rating
      t.references :author, index: true, foreign_key: true

      t.timestamps
    end
  end
end