class Genre < ApplicationRecord
  has_many :item_images, dependent: :destroy
end
