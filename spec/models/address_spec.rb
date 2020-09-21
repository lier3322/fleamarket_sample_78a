require 'rails_helper'

describe Address do
  describe '#create' do

    # 必須事項が入力されていれば登録ができる
    it "is valid with a postnumber prefecture city house_number" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 郵便番号が空だと登録できない
    it "is invalid without a postnumber" do
      address = build(:address, postnumber: nil)
      address.valid?
      expect(address.errors[:postnumber]).to include("を入力してください")
    end

    # 郵便番号がハイフンないと登録できない
    it "is invalid a postnumber match 7digits without hypen" do
      address = build(:address, postnumber: 1111111)
      address.valid?
      expect(address.errors[:postnumber]).to include("はハイフン(-)付き半角７桁で入力して下さい")
    end

    # 郵便番号が7桁未満だと登録できない
    it "is invalid a postnumber under 7digits with hypen" do
      address = build(:address, postnumber: 111-111)
      address.valid?
      expect(address.errors[:postnumber]).to include("はハイフン(-)付き半角７桁で入力して下さい")
    end

    # 郵便番号が7桁より上だと登録できない
    it "is invalid a postnumber over 7digits with hypen" do
      address = build(:address, postnumber: 1111-1111)
      address.valid?
      expect(address.errors[:postnumber]).to include("はハイフン(-)付き半角７桁で入力して下さい")
    end

    # 都道府県が空だと登録できない
      it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    # 市町村が空だと登録できない
      it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    # 番地が空だと登録できない
    it "is invalid without a house_number" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end
  end
end