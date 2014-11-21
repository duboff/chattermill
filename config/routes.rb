Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'registrations' }
  

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :companies
      resources :plans
      resources :projects
      resources :themes
    end
  end

  get '*path', to: 'home#index'
end
