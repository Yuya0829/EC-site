class Public::CartItemsController < ApplicationController

  def index
     @cart_items = current_customer.cart_items
  end

  def update
     @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "CartItem was successfully updated."
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
  end

  def destroy_all
  end

  def create
     @cart_item = current_user.cart_items.build(cart_item_params)
     @cart_item.save
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
