Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create,:index ]

  # ↑ 詳細機能の時resourcesにshowアクション記述する

end
