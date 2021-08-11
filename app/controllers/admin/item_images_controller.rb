class Admin::ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.all
  end

  def new
    @item_image = ItemImage.new
  end

  def create
    @item_image = ItemImage.new(item_image_params)
    @item_image.save
    redirect_to admin_item_image_path(@item_image)
  end

  def show
    @item_image = ItemImage.find(params[:id])
    @item_image_tax = (@item_image.price/1.1).round
  end

  def edit
    @item_image = ItemImage.find(params[:id])
  end

  def update
    @item_image = ItemImage.find(params[:id])
    @item_image.update(item_image_params)
    redirect_to admin_item_images_path(@item_image)
  end

  private

  def item_image_params
   params.require(:item_image).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end

end
