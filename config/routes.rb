Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  resources :users do
    resources :favorites
  end

  resources :recipes do
    resources :ratings
  end

  resources :sessions, :favorites, :ratings, :ingredients, :recipes
end
