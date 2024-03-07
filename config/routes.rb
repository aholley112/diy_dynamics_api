Rails.application.routes.draw do
  
    resources :users do
      resource :profile, only: [:show, :create, :update, :destroy]
    end

    resources :projects 
    resources :project_materials
    resources :project_tools

    get 'categories/search', to: 'categories#search'

    resources :categories
    resources :materials
    resources :tools 
    
    post '/login', to: 'sessions#login'
    post '/signup', to: 'users#create'
  
  end
  