Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  # post "/users/new", to: "users#new"
  # resource :logins
  # get "/login", to: "logins"
  get "/profile", to: "profiles#index"


  get "/follower", to: "relationships#follower"
  get "/following", to: "relationships#following"
  get "/search", to: "relationships#search"
  get "/manage", to: "relationships#manage"
  get "/deletem", to: "relationships#deletem"
  get "/showprofile", to: "relationships#show"

  get "/likes", to: "likes#like"
  get "/unlikes", to: "likes#unlike"
  get "/comments", to: "comments#show_comment"

  get "/allposts", to: "posts#allpost"

  get "/login", to: "logins#new"
  post "/login", to: "logins#create"
  get "/logout", to: "logins#logout"


end
