Rails.application.routes.draw do
  root 'pages#front'
  resources :campaigns, only: [:create, :show, :new]
  resources :users, only: [:create]
  get '/register', to: 'users#new'
end
