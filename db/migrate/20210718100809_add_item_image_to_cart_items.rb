class AddItemImageToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :item_image_id, :integer
  end
end
