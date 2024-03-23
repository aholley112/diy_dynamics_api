Rails.application.routes.draw do
  # User and Profile routes
  resources :users do
    resource :profile, only: [:show, :create, :update, :destroy]
    member do
      post 'upload_image'
    end
  end

  post '/login', to: 'sessions#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'profiles#show_current_user'


  # Project routes
  resources :projects do
    member do
      post 'upload_image'
      post 'add_to_favorites', to: 'favorites#create'
      delete 'remove_from_favorites', to: 'favorites#destroy'
    end
  end

  get 'users/:user_id/favorites', to: 'favorites#index'
  get 'favorites', to: 'favorites#index'


  # Category routes
  resources :categories do
    member do
      get 'projects', to: 'projects#index_by_category'
    end
    collection do
      get 'search', to: 'categories#search'
    end
  end


  namespace :admin do
    resources :categories  # Add more resources as needed for admin management
  end
  
  # Other resources
  resources :materials
  resources :tools 
  resources :project_materials
  resources :project_tools
end
