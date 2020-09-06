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
  |name|string|null: false|
  |price|string|null: false|
  |phone_number|integer|null: false|
  |birthday|integer|null: false|
  |password|integer|null: false|

  Assosiation
  has_many :logins
  has_many :credit_cards


   logins
  |Column|Type|Options|
  |------|----|-------|
  |email|string|null: false|

  Association
  belongs_to :user


  adress
  |Column|Type|Options|
  |------|----|-------|
  |postnumber|integer|null: false|
  |adress_large_area|string|null: false|
  |adress_small_area|string|null: false|
  |building|string||

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
  |product_id|integer|null: false, foreign_key: true|
  |user_id|integer|null: false, foreign_key: true|
  |category_id|integer|null: false, foreign_key: true|

  Assosiation
  belongs_to :users
  has_many :comments
  belongs_to :categories


  comments
  |Column|Type|Options|
  |------|----|-------|
  |text|text|null: false|
  |user_id|integer|null: false, foreign_key: true|
  |product_id|integer|null:false, fpreign_key: true|

  Assosiation
  belongs_to :products
  has_many :images


  images
  |Column|Type|Options|
  |------|----|-------|
  |image|text||

  Assosiation
  belongs_to :comments