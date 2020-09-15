Rails.application.routes.draw do
  resources :posts
  resources :users

  get 'feed' => 'feed#index'
  get 'explore' => 'feed#explore'

  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
end
