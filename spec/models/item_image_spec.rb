require 'rails_helper'
describe ItemImage do
  describe '#create' do

    it "画像がなければ登録できない" do
      itemimage = build(:item_image, image_url: "")
      itemimage.valid?
      expect(itemimage.errors[:image_url]).to include("can't be blank")
    end

    it "画像が商品と紐づかなければ登録できない" do
      itemimage = build(:item_image, item_id: "")
      itemimage.valid?
      expect(itemimage.errors[:item_id]).to include("can't be blank")
    end
  end
end