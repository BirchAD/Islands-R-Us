Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/islands', to: 'islands#index'
  get '/islands/new', to: 'islands#new'
  post '/islands/create', to: 'islands#create'
  get '/islands/:id', to: 'islands#show'
end
