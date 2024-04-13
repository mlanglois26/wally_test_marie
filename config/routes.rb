Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flats, only: [:index, :show]

  root to: "pages#home"
  get "flats/:id", to: "pages#show"
end
