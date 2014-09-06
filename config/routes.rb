Rails.application.routes.draw do
  devise_scope :user do
    get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
<<<<<<< HEAD
  root to: 'visitors#index'
  devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }
=======
  # root to: 'visitors#index'
  root to: 'home#index'

  devise_for :users
>>>>>>> 5743151291a6e9c4ea73ce35d47dbb9ed5b6e1ac
  resources :users

  get '*path', to: 'home#index'
end
