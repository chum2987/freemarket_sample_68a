require 'rails_helper'
describe Address do
  describe '#create' do
    it "必須項目が入力されていれば登録でききる" do
      user = create(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end

    it "family_nameがなければ登録できない" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがなければ登録できない" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end

    it "family_name_kanaがなければ登録できない" do
      address = build(:address, family_name_kana: "")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがなければ登録できない" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end

    it "family_nameが半角の場合登録できない" do
      address = build(:address, family_name: "YAMADA")
      address.valid?
      expect(address.errors[:family_name]).to include("is invalid")
    end

    it "first_nameが半角の場合登録できない" do
      address = build(:address, first_name: "TARO")
      address.valid?
      expect(address.errors[:first_name]).to include("is invalid")
    end

    it "family_name_kanaが半角の場合登録できない" do
      address = build(:address, family_name_kana: "ﾔﾏﾀﾞ")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("is invalid")
    end

    it "first_name_kanaが半角の場合登録できない" do
      address = build(:address, first_name_kana: "ﾀﾛｳ")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("is invalid")
    end

    it "postal_cadeがなければ登録できない" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it "postal_cadeが数字以外では登録できない" do
      address = build(:address, postal_code: "aaa")
      address.valid?
      expect(address.errors[:postal_code]).to include("is invalid")
    end

    it "prefecture_nameがなければ登録できない" do
      address = build(:address, prefecture_name: "")
      address.valid?
      expect(address.errors[:prefecture_name]).to include("can't be blank")
    end

    it "cityがなければ登録できない" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "streetがなければ登録できない" do
      address = build(:address, street: "")
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end

    it "building_nameが入力されていなくても登録でききる" do
      user = create(:user)
      address = build(:address, user_id: user.id, building_name: "")
      address.valid?
      expect(address).to be_valid
    end

    it "phone_numberが入力されていなくても登録でききる" do
      user = create(:user)
      address = build(:address, user_id: user.id, phone_number: "")
      address.valid?
      expect(address).to be_valid
    end
  end
end
