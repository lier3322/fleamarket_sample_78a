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
  |birthday|integer|null: false|
  |password|integer|null: false|
  |first_name|string|null: false|
  |second_name|string|null: false|
  |first_name_kana|string|null: false|
  |second_name_kana|string|null: false|
  |email_adress|string|null: false|

  Assosiation
  belongs_to :adress
  has_many :credit_cards
  has_many :products


  adress
  |Column|Type|Options|
  |------|----|-------|
  |postnumber|integer|null: false|
  |adress_large_area|string|null: false|
  |adress_small_area|string|null: false|
  |building|string||
  |phone_number|integer||
  |user_id|integer|null: false, foreign_key: true|
  Associations
  belongs_to :users


  credit_cards
  |Column|Type|Options|
  |------|----|-------|
  |card_number|integer|null: false|
  |user_id|integer|null: false, foreign_key: true|

  Associations
  belongs_to :users


  products
  |Column|Type|Options|
  |------|----|-------|
  |product_name|text|null: false|
  |price|integer|null: false|
  |brand|string||
  |size|string|null: false|
  |product_status|string|null: false|
  |delivery_fee|string|null: false|
  |delivery_time|integer|null: false|
  |delivery_area|string||
  |user_id|integer|null: false, foreign_key: true|

  Assosiation
  belongs_to :users
  has_many :comments


  images
  |Column|Type|Options|
  |------|----|-------|
  |image|text|null :false|
  |product_id|integer|null: false, foreign_key: true|

  Assosiation
  belongs_to :products

