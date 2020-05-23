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
    params.require(:address).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture_name, :city, :street, :building_name).merge(user_id: current_user.id)
  end
end