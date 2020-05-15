class CreditCardsController < ApplicationController
  require "payjp"
  def index
  end

  def new
    card = CreditCard.new
  end

  def destroy
  end
end
