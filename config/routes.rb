Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :posts, only: [:new, :create]
  # post "/users/new", to: "users#new"
  # resource :logins
  # get "/login", to: "logins"
  get "/profile", to: "profiles#index"


  get "/follower", to: "relationships#follower"
  get "/following", to: "relationships#following"

  get "/login", to: "logins#new"
  post "/login", to: "logins#create"



end
