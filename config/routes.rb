Rails.application.routes.draw do
  get 'relationships/follows'
  get 'relationships/followers'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
end