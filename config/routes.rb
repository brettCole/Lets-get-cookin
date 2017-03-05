Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  resources :sessions
  resources :favorites
  resources :ratings
  resources :ingredients
  resources :recipes
  resources :users
end
