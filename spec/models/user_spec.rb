require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての条件が整っている場合に登録できる" do
    user = build(:user)
    user.valid?
    expect(user).to be_valid
    end

    it "nicknameがなければ登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "family_nameがなければ登録できない" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがなければ登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "family_name_kanaがなければ登録できない" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがなければ登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birth_yearがなければ登録できない" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthがなければ登録できない" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayがなければ登録できない" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "emailがなければ登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがなければ登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end