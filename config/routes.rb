# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
    post '/users/sign_up', to: 'devise/registrations#create'
  end

  devise_for :users
  root 'landing_page#index'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
