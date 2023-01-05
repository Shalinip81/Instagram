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
  get "/search", to: "relationships#search"
  get "/manage", to: "relationships#manage"
  get "/deletem", to: "relationships#deletem"

  get "/likes", to: "likes#likecount"

  get "/allposts", to: "posts#allpost"

  get "/login", to: "logins#new"
  post "/login", to: "logins#create"


end
