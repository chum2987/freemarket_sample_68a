class SignupController < ApplicationController

  def step1
  end

  def step2
    @user = User.new
    
  end

  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
  end

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step5
  end

  

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :famile_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana, 
      :birth_day
    )
  end
end
