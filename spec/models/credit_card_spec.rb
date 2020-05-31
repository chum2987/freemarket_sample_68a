require 'rails_helper'
# 全てのspecファイルに書き込む

# describe "まとまりの説明" do
#   it "exampleの説明" do
    # 式 xの部分に入れた式の値がYの部分の値と等しければテストが成功
    # expect(X).to eq Y
    # eqをマッチャ
    # eq = 等しければ, include = 含んでいれば、valid = バリデーションされれば
#   end
# end

# modelのクラス名CreditCard
describe CreditCard do
  # Credit_Cardクラスにあるcreateメソッドをテストするまとまりという意味
  describe '#create' do
    # it~ 何をテストしたいかの説明
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