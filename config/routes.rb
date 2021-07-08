Rails.application.routes.draw do

  get 'formats/index'
  #patch 'formats/index'
  #patch '/users/products'
  #patch '/users/products/:id/edit', to: 'products'
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:create, :index ,:new]
  end


end
