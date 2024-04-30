Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  resources :users, only: [:index, :new, :create]
  root 'pages#index'
  get 'pages/secret'
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  post 'admin/use', to: 'users#usage'
end
