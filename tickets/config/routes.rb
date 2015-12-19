Rails.application.routes.draw do
  
  root to: 'seats#index'
  get 'seats' => 'seats#index', as: 'seats'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

end
