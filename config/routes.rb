Rails.application.routes.draw do
  get 'products/new'
  #get 'home/index'
  devise_for :users
  #get 'messages/index'
  root to: "products#index"

end
