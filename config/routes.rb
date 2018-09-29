require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :stories     
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  
  resources :stories do
    resource :like, module: :stories
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:show]

  root to: 'stories#index'
end
