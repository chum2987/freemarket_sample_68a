class CreditCardsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    card = CreditCard.where(users_id: current_user.id)
  end

  # Payjpとcredit_cardsのデータベースを作成
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjpToken"].blank?
      redirect_to credit_cards_path
    else
    customer = Payjp::Customer.create(card: params["payjpToken"],
    metadata: {user_id: current_user.id})

    @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        binding.pry
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def destroy
  end
end
