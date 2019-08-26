Rails.application.routes.draw do
  resources :posts
  resources :pages
  root to:  'pages#home'
  get       '/share',    to: 'pages#show'
  # post      '/share',    to: 'pages#create'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
