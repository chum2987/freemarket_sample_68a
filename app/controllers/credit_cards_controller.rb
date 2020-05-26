class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    if @card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
  end

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

  def delete
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to new_credit_card_path
  end

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end
end
