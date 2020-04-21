Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :new]
  resources :signup do
    collection do
      get 'step1' #新規会員登録
      get 'step2' #会員情報入力
      get 'step3' #電話番号認証
      get 'step4' #電話番号入力
      get 'step5' #完了
    end
  end
end
