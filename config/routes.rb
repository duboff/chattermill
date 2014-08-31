Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # root to: 'visitors#index'
  root to: 'home#index'
  
  devise_for :users
  resources :users
end
