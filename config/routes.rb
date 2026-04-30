Rails.application.routes.draw do
  resources :students
  root "users#index"
  get "users", to: "users#index"
  get "users/new", to: "users#new"
  get "users/:id", to: "users#show", as: "user"
  get "users/edit"
  post "users", to: "users#create"
  get "users/:id/edit", to: "users#edit", as: "edit_user"
  patch "users/:id", to: "users#update"
  put "users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"

  resources :users
  # get "static_pages/home"
  # get "static_pages/help"
  # get "static_pages/about"
  # get "static_pages/alaa"

  get "home", to: "static_pages#home"
  get "help", to: "static_pages#help"
  get "about", to: "static_pages#about"
  get "alaa", to: "static_pages#alaa"
end
