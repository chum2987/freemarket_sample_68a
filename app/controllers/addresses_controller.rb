class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_name, :city, :street, :building_name).merge(user_id: current_user.id)
  end
end