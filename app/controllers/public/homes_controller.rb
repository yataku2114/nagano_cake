class Public::HomesController < ApplicationController
  def top
    @item_images = ItemImage.all
    @genres = Genre.all
    
    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
    end
  end

  def about
  end
end
