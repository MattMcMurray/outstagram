Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  resources :follow_relationships, path: 'relationships'

  get 'feed' => 'feed#index'
  get 'explore' => 'feed#explore'
  post 'users/follow' => 'users#follow'


  get 'welcome/index'
  root 'welcome#index'
end
