Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts
  resources :users
  resources :follow_relationships, path: 'relationships'

  get 'feed' => 'feed#index'
  get 'explore' => 'feed#explore'
  post 'users/follow' => 'users#follow'
  post 'users/unfollow' => 'users#unfollow'


  get 'welcome/index'
  root 'welcome#index'
end
