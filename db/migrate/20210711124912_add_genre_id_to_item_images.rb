class AddGenreIdToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :genre_id, :integer
  end
end
