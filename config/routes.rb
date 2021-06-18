Rails.application.routes.draw do
  #get 'products/new'
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create, :show, :index ]

end
