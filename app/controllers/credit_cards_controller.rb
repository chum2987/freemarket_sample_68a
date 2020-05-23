class CreditCardsController < ApplicationController
  require "payjp"

  def index
  end

  def new
  end

  # Payjpとcredit_cardsのデータベースを作成
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjpToken"].blank?
      redirect_to credit_cards_path
    else
    customer = Payjp::Customer.create(card: params["payjpToken"])

    @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to credit_cards_path
      else
        redirect_to new_credit_card_path
      end
    end
  end

  def destroy
  end
end
