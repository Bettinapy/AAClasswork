Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :user_goals

  resources :users, except:[:index] 

  resource :session


end


