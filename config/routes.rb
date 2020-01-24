Rails.application.routes.draw do
 
  resources :users
  resources :searches, only: [:index, :show, :create, :new]
  resources :restaurants, only: [:index, :show]
  resources :favorites
  resources :items
  resources :cart_items
  namespace :api do
    namespace :v1 do
       
      post '/login', to: 'auth#create'
      get '/reauth', to: 'auth#show'
     end
  end
end
