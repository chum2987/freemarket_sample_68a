Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
  root to: "items#index"
  resources :items do
    member do
      get "purchase"
    end
  end
  resources :users, only: [:show, :new] do
    member do
      get "signout"
      get "card"
    end
  end
  resources :phones, only: [:new, :create]
  resources :credit_cards, only: [:index, :new, :destroy]
  resources :item_images
  resources :addresses, only: [:new, :create]
  resources :categories, only: [:show]
end

