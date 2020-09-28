Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  
  get 'users/:id', to: 'mypages#show'

  get 'creditcards/:id', to: 'creditcards#index'

  resources :products do
  end
  resources :users, only: [:index]
  resources :mypages, only: [:show, :index]
  resources :creditcards, only: [:new, :create, :edit, :update,]
end
  # resources :users, only: [:index]

  # resources :products, except: :show  
  # resources :addresses , only: [:new, :create ]

  resources :users, only: [:index]

  resources :products, except: :show  
  resources :addresses , only: [:new, :create ]
  end

