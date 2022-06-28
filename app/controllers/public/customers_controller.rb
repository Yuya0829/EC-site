class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customers_params)
      flash[:notice] = "Customer was successfully updated."
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end
  
  def unsubscrive
  end
  
  def withdraw
  end

  private

   def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
   end

end
