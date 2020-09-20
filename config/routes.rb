Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :products, except: :show  
  resources :addresses , only: [:new, :create ]

end
