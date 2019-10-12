Rails.application.routes.draw do
  resources :users, except: :index
  get '/login', to: 'sessions#new'
end
