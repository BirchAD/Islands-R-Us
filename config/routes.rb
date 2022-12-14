Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bookings, only: %i[update show]

  resources :users, only: :show do
    resources :bookings, only: :index
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :islands, only: %i[new create show index edit update destroy] do
    resources :bookings, only: %i[new create]
  end
  get '/bookings/:id', to: 'bookings#destroy', as: :delete_booking
  get '/users/:user_id/islands', to: 'islands#myislands', as: :my_islands
  # get '/islands/:id', to: 'islands#destroy', as: :delete_island
end
