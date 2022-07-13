class Admin::HomesController < ApplicationController

  def top
    @order = Orders.page(params[:page])
  end

end
