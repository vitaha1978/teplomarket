Rails.application.routes.draw do

  resources :line_items

  match '/contacts', to: 'static_pages#contacts', via: 'get'

  resources :carts
  resources :products

  get 'store/index'
  root to: 'store#index', as: 'store'
end
