class SignupController < ApplicationController

  def step1
  end

  def step2
    @user = User.new
  end

  
end
