Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :searches
  # resources :restaurants
  # resources :favorites
  # resources :items
  # resources :cart_items
  # namespace :api do
  #   namespace :v1 do
  #     post '/login', to: 'auth#create'
  #     get '/reauth', to: 'auth#show'
  #   end
  # end
  namespace :api do
    namespace :v1 do
      resources :restaurants
      post '/login', to: 'auth#create'
      # get '/reauth', to: 'auth#show'
      resources :users do
        resources :cart_items
        resources :searches
        resources :items
        resources :favorites
      end
    end
  end
end
