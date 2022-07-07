class Public::ItemsController < ApplicationController

  def index
     @genres = Genre.all
     @item = Item.page(params[:page])
     @items = Item.page(params[:page])
     @items_count = Item.count
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
