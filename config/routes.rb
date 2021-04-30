Rails.application.routes.draw do
  root('static#home')
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/account', to:'users#account'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'# destroy ?

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  

  resources :comments
  resources :photos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
