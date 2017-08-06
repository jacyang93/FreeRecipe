Rails.application.routes.draw do
  get 'jokes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
  get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'
root "users#new"
get "/auth/:provider/callback" => "sessions#create_from_omniauth"
resources :users
end
