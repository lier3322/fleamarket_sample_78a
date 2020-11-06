require 'rails_helper'

RSpec.describe Creditcard, type: :model do
  describe '#create' do
    it "is invalid without a card_id" do
    creditcard = build(:creditcard, card_id: nil)
    creditcard.valid?
    expect(creditcard.errors[:card_id]).to include("を入力してください")
    end
  end
end
