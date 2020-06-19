Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users 
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # delete '/users/:id', to: 'users#destroy' 
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  resources :users, only: [:index, :create, :show, :destroy, :update] do
     resources :artworks, only: [:index]
     resources :comments, only: [:index]
  end
  resources :artworks, only: [:index, :create, :show, :destroy, :update] do
     resources :comments, only: [:index]
  end
  
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

end
