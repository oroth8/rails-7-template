# frozen_string_literal: true

Rails.application.routes.draw do
  resources :units
  resources :organisations
  devise_for :users
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    post "/users/sign_up", to: "users/registrations#create"
    
  end
  resources :users, only: %i[index update]

  root "landing_page#index"
  get "/dashboard", to: "dashboard#index", as: "dashboard"
end
