class Public::ItemsController < ApplicationController
  def index
    @item_images = ItemImage.all
    @item_images = ItemImage.all
    @genres = Genre.all

    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
    end
  end

  def show
    @item_image = ItemImage.find(params[:id])
    @cart_item = CartItem.new
  end
end
