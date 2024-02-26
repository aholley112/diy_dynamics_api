Rails.application.routes.draw do
    resources :users do
      resource :profile, only: [:show, :create, :update, :destroy]
    end

    resources :materials

    resources :tools 
    
    post '/login', to: 'sessions#login'
  end
  