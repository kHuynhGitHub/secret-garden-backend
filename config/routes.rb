Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books
  get "/users", to: "users#index", as: :users
  post "/users", to: "users#create"
  get "/users/:username", to: "users#show", as: :user
  # get "/users/:username", to: "users#show_username"
  # get "/users/:id", to: "users#show", as: :user
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  # resources :users
  resources :bookcases

end
