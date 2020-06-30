Rails.application.routes.draw do
  resources :homes
  resources :books
  devise_for :users
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  root 'books#index'
end