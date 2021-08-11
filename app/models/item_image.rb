class ItemImage < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
