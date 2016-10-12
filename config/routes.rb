Rails.application.routes.draw do
  root 'pages#front'
  resources :campaigns, only: [:create]
end
