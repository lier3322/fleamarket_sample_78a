class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postnumber, :prefecture, :city, :house_number, presence: true
  validates :first_name, :last_name, presence: true,
  format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: "は全角（ひらがな、カタカナ、漢字）のみで入力して下さい"
  }
validates :first_name_kana, :last_name_kana, presence: true,
  format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナのみで入力して下さい"
  }
end
