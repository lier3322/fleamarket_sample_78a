# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


  users
  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false|
  |birthday|date|null: false|
  |password|integer|null: false|
  |first_name|string|null: false|
  |second_name|string|null: false|
  |first_name_kana|string|null: false|
  |last_name_kana|string|null: false|
  |email_adress|string|null: false|

  Assosiation
  has_one :address
  has_many :credit_cards
  has_many :products


  address
  |Column|Type|Options|
  |------|----|-------|
  |postnumber|string|null: false|
  |prefecture|string|null: false|
  |city|string|null: false|
  |building|string||
  |phone_number|string||
  |user_id|integer|null: false, foreign_key: true|
  Associations
  belongs_to :users


  credit_cards
  |Column|Type|Options|
  |------|----|-------|
  |card_number|integer|null: false|
  |user_id|integer|null: false, foreign_key: true|

  Associations
  belongs_to :user


  products
  |Column|Type|Options|
  |------|----|-------|
  |product_name|text|null: false|
  |price|integer|null: false|
  |brand|string||
  |size|size_id|null: false|
  |product_status|status_id|null: false|
  |delivery_fee|fee_id|null: false|
  |delivery_time|time_id|null: false|
  |delivery_area|string||
  |user_id|integer|null: false, foreign_key: true|

  Assosiation
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time


  images
  |Column|Type|Options|
  |------|----|-------|
  |image|text|null :false|
  |product_id|integer|null: false, foreign_key: true|

  Assosiation
  belongs_to :product



