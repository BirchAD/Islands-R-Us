Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :islands, only: [:index, :show, :new, :create]
  # get '/islands', to: 'islands#index'
  # # get '/islands/new', to: 'islands#new'
  # get '/islands/:id', to: 'islands#show'
end
