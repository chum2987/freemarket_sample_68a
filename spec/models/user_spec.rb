require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての条件が入力されていれば登録できる" do
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
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthがなければ登録できない" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayがなければ登録できない" do
      user = build(:user, birth_day: nil)
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

    it "passwordが7文字未満では登録できない" do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "passwordが存在してもpassword_confirmation(確認用password)がなければ登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordとpassword_confirmation(確認用password)が一致しなければ登録できない" do
      user = build(:user, password_confirmation: "aaabbb")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "既に登録されているemailアドレスでは登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "emailアドレスに@がないと登録できない" do
      user = build(:user, email: "email")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailアドレスにドメインがないと登録できない" do
      user = build(:user, email: "a@.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "family_nameが半角の場合登録できない" do
      user = build(:user, family_name: "YAMADA")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    it "first_nameが半角の場合登録できない" do
      user = build(:user, first_name: "TARO")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it "family_name_kanaが半角の場合登録できない" do
      user = build(:user, family_name_kana: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    it "first_name_kanaが半角の場合登録できない" do
      user = build(:user, first_name_kana: "ﾀﾛｳ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
  end
end
