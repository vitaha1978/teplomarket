Rails.application.routes.draw do
  
  resources :brands
  resources :categories
  resources :users
  resources :orders
  resources :articles
  resources :line_items
  resources :carts
  resources :products
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup',   to: 'users#new',             via: 'get'
  match '/signin',   to: 'sessions#new',          via: 'get'
  match '/signout',  to: 'sessions#destroy',      via: 'delete'
  
  match '/contacts', to: 'static_pages#contacts', via: 'get'

  resources :products do
    get :who_bought, on: :member
  end

  get 'store/index'
  root to: 'store#index', as: 'store'
end
