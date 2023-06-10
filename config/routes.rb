Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :auction_transactions
  resources :auctions
  devise_for :users
  resources :users
  post "/bid/:id", controller: :auctions, action: :bid, as: "bid"
  get "/profile/:id", controller: :users, action: :profile, as: "profile"
end
