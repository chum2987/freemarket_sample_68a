Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show] do
    member do
      get "signout"
      get "card"
    end
  end
end
