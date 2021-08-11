class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_select] == "0"
      @order.address = current_public.address
      @order.postal_code = current_public.postal_code
      @order.name = current_public.last_name + current_public.first_name
    elsif params[:order][:address_select] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:address_select] == "2"
    end
    @cart_items = current_public.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      tal = cart_item.item_image.price * cart_item.amount
      @total += tal
    end
  end

  def complete
  end

  def create
    @cart_items = current_public.cart_items
    @order = Order.new(order_params)
    @order.public_id = current_public.id
    @order.save
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_image_id = cart_item.item_image.id
      order_detail.order_id = @order.id
      order_detail.price = cart_item.item_image.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    @cart_items.destroy_all
    @address = Address.new
      @address.name = @order.name
      @address.postal_code = @order.postal_code
      @address.address = @order.address
      @address.public_id = current_public.id
    @address.save
    redirect_to public_orders_complete_path
  end

  def index
    @orders = current_public.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.shipping_cost = 800
    @order.order_details.each do |f|
      tal = f.item_image.price * f.amount
      @total += tal
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :postal_code, :payment, :name, :payment_method)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_image_id, :price, :amount, :status)
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
