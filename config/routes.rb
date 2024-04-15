Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
 end

  resources :flats, only: [:index, :show, :new, :create]

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: %i[create edit show update destroy]
  root to: "pages#home"
  get "flats/:id", to: "pages#show"
  get "/dashboard", to: "pages#dashboard"
end
