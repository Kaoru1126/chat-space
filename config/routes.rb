Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   root 'messages#index'
   # User情報編集機能 no.6 ルートの設定？
    resources :users, only: [:edit, :update]

   # get '' => '#edit'
end
