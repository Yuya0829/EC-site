class Public::AddressesController < ApplicationController

  def index
  end

  def edit
  end

  def create
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
