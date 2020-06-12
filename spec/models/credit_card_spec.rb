require 'rails_helper'

# modelのクラス名CreditCard
describe CreditCard do
  # Credit_Cardクラスにあるcreateメソッドをテストするまとまりという意味
  describe '#create' do
    it "user_idとcard_idとcustomer_idがあると登録できる" do
      user = create(:user)
      card = build(:credit_card, user_id: user.id)
      # valid?メソッドでバリデーションが効いているか確認
      card.valid?
      expect(card).to be_valid
    end

    it "card_idがない場合は登録できない" do
      user = create(:user)
      card = build(:credit_card, user_id: user.id, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

    it "customer_idがない場合は登録できない" do
      user = create(:user)
      card = build(:credit_card, user_id: user.id, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
  end
end
