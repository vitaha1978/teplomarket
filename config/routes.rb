Rails.application.routes.draw do

  match '/contacts', to: 'static_pages#contacts', via: 'get'

  resources :carts
  resources :products

  get 'store/index'
  root to: 'store#index', as: 'store'
end
