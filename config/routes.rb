# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/about', to: 'pages#about', as: :about
  resources :athletes, only: %i[index show]
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
