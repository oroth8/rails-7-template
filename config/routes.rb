Rails.application.routes.draw do
  root 'landing_page#index'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
