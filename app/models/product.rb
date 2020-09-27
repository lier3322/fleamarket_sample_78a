class Product < ApplicationRecord
  belongs_to :user
  has_many :images

  # 商品一覧にて実装しないのでコメントアウト。次回実装時にお使いくださいませ。
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size 
  belongs_to_active_hash :product_status 
  belongs_to_active_hash :delivery_fee 
  belongs_to_active_hash :delivery_time

  # 商品一覧実装時にはテスト画像を利用するのでコメントアウト。次回実装する際にお使いくださいませ。
  # accepts_nested_attributes_for :images, allow_destroy: true

  # 列挙型：trading_statusの定義。商品一覧作成時はコメントアウト。次回実装時にお使いくださいませ。
  # enum trading_status: {出品中: 1, 売買済: 2}

  accepts_nested_attributes_for :images, allow_destroy: true

end
