Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "uploads#index"
  get "/uploads/new", to: "uploads#new", as: :new_upload
  get "/uploads/:id", to: "uploads#show", as: :upload
  post "/uploads", to: "uploads#create", as: :uploads
end
