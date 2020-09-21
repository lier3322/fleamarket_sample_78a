Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  resources :products do
  end
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # resources :addresses , only: [:new, :create ]
end

  resources :users, only: [:index]

  resources :products, except: :show  
  resources :addresses , only: [:new, :create ]
  end
