Rails.application.routes.draw do
  
  root to: 'seats#index'
  resources :seats, only: [:index, :show, :update]
  post '/update' => 'seats#update', as: 'update'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

end
