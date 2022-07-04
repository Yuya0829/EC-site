class Public::ItemsController < ApplicationController

  def index
     @genres = Genre.all
     @item = Item.page(params[:page])
     @items = Item.page(params[:page])
     @items_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
