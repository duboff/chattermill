Rails.application.routes.draw do
  devise_scope :user do
    get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }
  resources :users
end
