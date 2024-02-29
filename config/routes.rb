Rails.application.routes.draw do
  #get 'project/Materials' This automatically updated.
  
    resources :users do
      resource :profile, only: [:show, :create, :update, :destroy]
    end

    resources :materials

    resources :tools 
    
    post '/login', to: 'sessions#login'
    post '/signup', to: 'users#create'
  end
  