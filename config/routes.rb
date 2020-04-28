Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
  root to: "items#index"
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :new]
  resources :signup, only: [:create] do
    collection do
      get 'user_registration' #新規会員登録
      get 'new_user' #会員情報入力
      post 'create_user' 
      get 'new_phone' #電話番号入力
      post 'create_phone' 
      get 'new_sms' #認証番号入力
      post 'create_sms'
      get 'complete' #完了
    end
  end
  resources :phones, only: [:new, :create]
end
