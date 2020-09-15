Rails.application.routes.draw do
  resources :posts
  get 'create' => 'posts/create'
  get 'feed' => 'feed#index'

  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
end
