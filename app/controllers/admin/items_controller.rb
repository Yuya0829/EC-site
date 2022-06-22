class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item was successfully created."
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page])
    @genres = Genre.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @tax_out = ((@item.price) / 1.10).to_i
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Item was successfully updated."
      redirect_to admin_items_path
    else
      render :edit
    end
  end


  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price)
  end

end
