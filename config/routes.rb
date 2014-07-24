Rails.application.routes.draw do

  resources :brands

  resources :categories

  resources :orders
  resources :articles
  resources :line_items
  resources :carts
  resources :products

  match '/contacts', to: 'static_pages#contacts', via: 'get'

  resources :products do
    get :who_bought, on: :member
  end

  get 'store/index'
  root to: 'store#index', as: 'store'
end
