class Admin::OrderDetailsController < ApplicationController
  
  def update
     @order = Order.find(params[:id])
    if @order.order_details.update(order_detail_params)
      
      if @order.order_details.making_status == 'in_production'  #もしorder.detailsのmaking_status==製作中だったら
         @order.update(status: 'in_production')                 #@orderのstatusを製作中にupdate
      elsif
         @order.order_details.making_status == 'production_completed'  #もしorder.detailsのmaking_status==製作完了だったら
          @order.update(status: 'preparing_to_ship')                   #@orderのstatusを発送準備中にupdate
      end
      
      flash[:notice] = "Order_detail was successfully updated."
      redirect_to admin_order_path(@order.id)
      
    else
      render :admin_order_path(@order.id)
    end
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:status, :making_status)
  end
  
end
