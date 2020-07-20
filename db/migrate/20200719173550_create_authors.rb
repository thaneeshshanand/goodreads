class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.text :name
      t.text :born
      t.text :website
      t.text :genre

      t.timestamps
    end
  end
end
