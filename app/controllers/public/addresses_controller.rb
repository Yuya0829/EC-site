class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "Address was successfully created."
      redirect_to public_addresses_path
    else
      @address = Address.all
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private

  def addresses_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
