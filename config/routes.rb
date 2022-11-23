Rails.application.routes.draw do
  devise_for :users do
    resources :bookings, only: %i[index show edit destroy]
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :islands, only: %i[new create show index edit update destroy] do
    resources :bookings, only: %i[new create]
  end
end
