Rails.application.routes.draw do
  root 'pages#front'
  resources :campaigns, only: [:create, :show, :new, :index]
  resources :users, only: [:create]
  resources :votes, only: [:create]
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
