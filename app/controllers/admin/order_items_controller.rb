class Admin::OrderItemsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.shipping_cost = 800
    @order.order_details.each do |f|
      tal = f.item_image.price * f.amount
      @total += tal
    end
  end
end
