Rails.application.routes.draw do
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :new] do
    member do
      get "signout"
      get "card"
    end
  end
end
