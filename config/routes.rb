Rails.application.routes.draw do

  get 'formats/index'
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:create, :index ,:new]
  end


end
