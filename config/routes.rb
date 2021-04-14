Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :facebook_logins, only: [:create]
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
