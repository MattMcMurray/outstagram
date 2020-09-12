Rails.application.routes.draw do
  get 'feed' => 'feed#index'

  devise_for :users

  get 'welcome/index'
  root 'welcome#index'
end
