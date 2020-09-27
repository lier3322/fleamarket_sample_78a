Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  # resources :products do

  resources :products, only: [:show, :new, :create, :index]  
  resources :addresses , only: [:new, :create ]

  # end
  resources :users, only: [:index]

  resources :products, except: :show  
  resources :addresses , only: [:new, :create ]
  end
