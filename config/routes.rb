Rails.application.routes.draw do
  resources :posts
  root to: 'pages#home'
  get     '/share',    to: 'pages#show'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
