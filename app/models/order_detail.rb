class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item_image

  enum making_status: { "着手不可":0, "製作中":1, "製作終了":2 }

end
