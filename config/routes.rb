Rails.application.routes.draw do
  root('static#home')
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/photos/most_commented', to: 'photos#most_commented'

  resources :users
  resources :photos do
    resources :comments, only: [:new, :create, :index]

  end
  
# custom route that goes to /photos/most_commented 
#have a scope method that will organize 
#the photo by the one that has the most comments to use active record scope method 
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
