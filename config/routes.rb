Rails.application.routes.draw do

  get 'projects/search', to: 'projects#search'
  get 'categories/search', to: 'categories#search'

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
    resources :comments, only: [:index, :create, :destroy, :update]
    resources :likes, only: [:create, :destroy]
  end
  resources :likes, only: [:destroy]
  get 'users/:user_id/favorites', to: 'favorites#index'
  get 'favorites', to: 'favorites#index'


  # Category routes
  resources :categories do
    member do
      get 'projects', to: 'projects#index_by_category'
    end
  end
  
  resources :favorites do
    member do
      put :status, action: :update_status
      post 'add_to_planner', to: 'favorites#add_to_planner'
      post 'remove_from_planner', to: 'favorites#remove_from_planner'
    end
  end


  namespace :admin do
    resources :categories  
  end
  
  # Other resources
  resources :materials
  resources :tools 
  resources :project_materials
  resources :project_tools
end
