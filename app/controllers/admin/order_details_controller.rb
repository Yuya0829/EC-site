class Admin::OrderDetailsController < ApplicationController

  def update
     @order_detail = OrderDetail.find(params[:id])
     @order = @order_detail.order
    if @order_detail.update(order_detail_params)

      if @order_detail.making_status == 'in_production'  #もしorder.detailsのmaking_status==製作中だったら
         @order.update(status: 'in_production')                 #@orderのstatusを製作中にupdate
      end

      is_all_completed = true           #全て製作完了だったら
      @order.order_details.each do |order_detail|
        if order_detail.making_status != "production_completed"
          is_all_completed = false
        end
      end

      if is_all_completed                          #もしorder.detailsのmaking_status==製作完了だったら
        @order.update(status: "preparing_to_ship") #@orderのstatusを発送準備中にupdate
      end

      # completed_count = 0
      # @order.order_details.each do |order_detail|
      #   if order_detail.making_status == "production_completed"
      #     completed_count += 1
      #   end
      # end
      # if completed_count == @order.order_details.count
      #   @order.update(status: "preparing_to_ship")
      # end

      flash[:notice] = "Order_detail was successfully updated."
      redirect_to admin_order_path(@order.id)

    else
      render admin_order_path(@order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
