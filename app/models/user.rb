class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
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

    has_one :address
    has_many :products
    has_many :creditcards
end