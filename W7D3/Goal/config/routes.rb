Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, except:[:index] do 
    resources :user_goals, only: :index
  end
  resources :user_goals
  resource :session


end


