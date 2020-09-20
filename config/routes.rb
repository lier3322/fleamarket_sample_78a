Rails.application.routes.draw do
  root to: 'items#index'
  resources :products do
  end
end
