class AddCoverPicToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :cover_pic, :varchar
  end
end
