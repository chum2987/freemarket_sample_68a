class PhonesController < ApplicationController

  def new
  end

  def create
    @user = User.new(session["devise.regist_data"]["user"])
    @phone = Phone.new(phone_params)
    @user.build_phone(@phone.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    render complete_signup_index_path
  end

  protected

  def phone_params
    params.require(:phone).permit(:phone_number)
  end

end
