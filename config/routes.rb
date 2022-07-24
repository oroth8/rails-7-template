# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    post '/auth/register/signup', to: "users/registrations#create"
  end
  namespace :admin do
    resources :units
    resources :organisations
    resources :users

    root to: "units#index"
  end
  resources :users, only: %i[index update]
  resources :organisations
  resources :units
  root "landing_page#index"
  get "/dashboard", to: "dashboard#index", as: "dashboard"
end
