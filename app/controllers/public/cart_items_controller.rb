class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
    @cart_items.each do |cart_item|
      tal = cart_item.item_image.price * cart_item.amount
      @total += tal
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to root_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.public_id = current_public.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_image_id, :public_id, :amount)
  end

end
