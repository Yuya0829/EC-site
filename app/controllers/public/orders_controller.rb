class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all

  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    #binding.pry
  end

  def compleate
  end

  def create
     @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order was successfully created."
      redirect_to new_order_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
