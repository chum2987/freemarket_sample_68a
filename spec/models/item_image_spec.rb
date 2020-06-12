require 'rails_helper'
describe ItemImage do
  describe '#create' do
    it "画像がなければ登録できない" do
      itemimage = build(:item_image, image_url: "")
      itemimage.valid?
      expect(itemimage.errors[:image_url]).to include("can't be blank")
    end
  end
end
