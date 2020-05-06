Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
  root to: "items#index"
  resources :items
  resources :users, only: [:show, :new] do
    member do
      get "signout"
      get "card"
    end
  end
  resources :phones, only: [:new, :create]
  resources :addresses, only: [:new, :create]
  resources :categories, only: [:show]
end
