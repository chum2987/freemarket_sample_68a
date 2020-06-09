require 'rails_helper'
describe Item do
  describe '#create' do

    it "全ての条件を入力すると登録ができる" do
      user = create(:user)
      category = create(:category)
      item = build(:item, seller_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end

    it "商品名がなければ登録できない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("入力してください")
    end
    #   通常の記述はinclude("can't be blank"")だが、
    #   models.item.rbのバリデーションで
    #   "入力してください"と空投稿で表示されるように変更している為、
    #   include("入力してください")で記載。

    it "価格がなければ登録できない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "商品の説明がなければ登録できない" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("入力してください")
    end

    it "カテゴリーがなければ登録できない" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("選択してください")
    end

    it "商品の状態がなければ登録できない" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("選択してください")
    end

    it "配送料の負担がなければ登録できない" do
      item = build(:item, shipping_fee: "")
      item.valid?
      expect(item.errors[:shipping_fee]).to include("選択してください")
    end

    it "発送元の地域がなければ登録できない" do
      item = build(:item, shipping_method: "")
      item.valid?
      expect(item.errors[:shipping_method]).to include("選択してください")
    end

    it "発送までの日数がなければ登録できない" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include("選択してください")
    end
  end
end


