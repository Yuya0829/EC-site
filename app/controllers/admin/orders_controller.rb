class Admin::OrdersController < ApplicationController

  def show
     @order = Order.find(params[:id])
     @total = 0
     @order.order_details.each do |order_detail|
       @total += order_detail.subtotal
     end
     @order.shipping_cost = 800
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Order was successfully updated."
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost, :customer_id, :status)
  end

end
