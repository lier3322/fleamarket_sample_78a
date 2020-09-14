require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    # 必須項目が入力されていれば登録ができる
    it "is valid with necessary contents" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームが空白だと登録できない
    it "is invalid without nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # emailが空白だと登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # first_nameが空白だと登録できない
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # first_nameが半角だと登録できない
    it "is invalid a first_name input half_size" do
      user = build(:user, first_name: 'aaa')
      user.valid?
      expect(user.errors[:first_name]).to include("は全角（ひらがな、カタカナ、漢字）のみで入力して下さい")
    end

    # last_nameが空白だと登録できない
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    # last_nameが半角だと登録できない
    it "is invalid a last_name input half_size" do
      user = build(:user, last_name: 'aaa')
      user.valid?
      expect(user.errors[:last_name]).to include("は全角（ひらがな、カタカナ、漢字）のみで入力して下さい")
    end

    # first_name_kanaが空白だと登録できない
     it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    # first_name_kanaが半角だと登録できない
    it "is invalid a first_name_kana input half_size" do
      user = build(:user, first_name_kana: 'ｶﾅ')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # first_name_kanaが全角漢字だと登録できない
    it "is invalid a first_name_kana input kanji" do
      user = build(:user, first_name_kana: '漢字')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # first_name_kanaが全角ひらがなだと登録できない
    it "is invalid a first_name_kana input hiragana" do
      user = build(:user, first_name_kana: 'かな')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # last_name_kanaが空白だと登録できない
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    # last_name_kanaが半角だと登録できない
    it "is invalid a last_name_kana input half_size" do
      user = build(:user, last_name_kana: 'ｶﾅ')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # last_name_kanaが全角漢字だと登録できない
    it "is invalid a last_name_kana input kanji" do
      user = build(:user, last_name_kana: '漢字')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # last_name_kanaが全角ひらがなだと登録できない
    it "is invalid a last_name_kana input hiragana" do
      user = build(:user, last_name_kana: 'かな')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カタカナのみで入力して下さい")
    end

    # birthdayが空白だと登録できない
    it "is invalid without a birth_year" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    # passwordが空白だと登録できない
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # password_confirmationが空白だと登録できない
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 重複したemailが存在すると登録できない
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # passwordが6文字以下だと登録できない
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end