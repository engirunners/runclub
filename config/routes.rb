# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages/:page', to: 'pages#show', as: :page
  resources :photos, only: :index
  resources :athletes, only: :index
  resources :achievements, only: :index
  resources :events, only: :index

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  authenticate :user, ->(user) { user.present? } do
    mount RailsPerformance::Engine => '/app_performance'
  end
end
