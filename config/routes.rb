Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  # post "/users/new", to: "users#new"
  # resources :logins
  get "/logins", to: "logins#create"



end
