Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  resources :users, only: [:index]
  resources :mypages, only: [:show, :index]
  resources :creditcards

  
  resources :products do
    collection do
      get 'done', to: 'products#done'
    end
    member do
      get 'purchase_check', to:'products#purchase_check'
      post 'purchase_completed', to:'products#purchase_completed'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'products/:id' => 'products#show'
      get 'purchase_completed'

    end
  end

  resources :addresses , only: [:new, :create ]

  # 削除済商品へのアクセスした場合のエラー画面を表示するためのルーティング
  get 'not_found', to:'products#not_found'

  # クレジットカード登録ページのルーティング
  get 'card', to:'mypages#card'

  end

