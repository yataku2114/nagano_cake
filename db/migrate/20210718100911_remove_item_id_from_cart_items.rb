class RemoveItemIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :item_id, :integer
  end
end
