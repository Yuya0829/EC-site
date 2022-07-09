class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
    
  end

  def confirm
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
     params.require(:order).permit(:customer_id, :postal_code, :address, :name, :is_active)
  end

end
