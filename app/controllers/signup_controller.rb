class SignupController < ApplicationController

  def step2
    @user = User.new
  end
end
