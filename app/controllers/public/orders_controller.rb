class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all

  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @select_address = params[:select_address]
     if @select_address == "0"
        @address = Customer.find_by(id: current_customer.id)
        @postal_code = @address.postal_code
        @current_customer_address = @address.address
        @name =  @address.last_name + @address.first_name
     elsif @select_address == "1"
        @address = Address.find(params[:address_id])
        @postal_code = @address.postal_code
        @current_customer_address = @address.address
        @name = @address.name
     else
        @postal_code = params[:order][:postal_code]
        @current_customer_address = params[:order][:address]
        @name = params[:order][:name]
     end
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
