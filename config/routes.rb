Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :facebook_logins, only: [:create]
  resources :line_items
  resources :carts
  resources :newsletters, only: [] do
    collection do
      post :subscribe
    end
  end

  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
  end

  post '/ext/facebook/webhooks' => 'ext/webhooks#create'
  get '/ext/facebook/webhooks' => 'ext/webhooks#facebook_verify'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
