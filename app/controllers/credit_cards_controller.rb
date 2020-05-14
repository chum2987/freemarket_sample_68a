class CreditCardsController < ApplicationController
  require "payjp"

  def new
    @card = CreditCard.new
  end

  def destroy
  end
end
