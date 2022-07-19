class Public::OrdersController < ApplicationController

   before_action :authenticate_customer!


  def new
    @order = Order.new
    @addresses = current_customer.addresses
    if current_customer.cart_items.empty?
      redirect_to cart_items_path
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @select_address = params[:select_address]
     if @select_address == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name =  current_customer.last_name + current_customer.first_name
     elsif @select_address == "1"
        @address = Address.find(params[:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
     else
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
     end
    #binding.pry
  end

  def compleate
  end

  def create
     @order = Order.new(order_params)
     @order.status = 0
    if @order.save
      flash[:notice] = "Order was successfully created."
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item.id
        order_detail.order_id = @order.id
        order_detail.price = cart_item.item.with_tax_price
        order_detail.amount = cart_item.amount
        order_detail.making_status = 0
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_compleate_path
    else
      render :new
    end
  end

  def index
     @cart_items = current_customer.cart_items
     @orders = current_customer.orders

  end

  def show
     @order = current_customer.orders.find(params[:id])
     @total = 0
     @order.order_details.each do |order_detail|
       @total += order_detail.subtotal
     end
     @order.shipping_cost = 800
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost, :customer_id, :status)
  end

end
