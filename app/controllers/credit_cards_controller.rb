class CreditCardsController < ApplicationController
  require "payjp"

  # 仮でCreditcard.newとしている
  def new
    @card = CreditCard.new
  end

  def create
  end
end
