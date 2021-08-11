class Order < ApplicationRecord
  belongs_to :public
  has_many :order_details, dependent: :destroy

  enum payment_method: [:"クレジットカード", :"銀行振込"]
  enum status: { a:0, b:1, c:2, d:3, e:4 }
end
