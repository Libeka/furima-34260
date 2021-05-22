Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  get 'messages/index'
  root to: "messages#index"

end
