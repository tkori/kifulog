Rails.application.routes.draw do
  root 'kifus#index'
  resources :users, except: :index
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :kifus, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
