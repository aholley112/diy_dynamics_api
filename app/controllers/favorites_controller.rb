class FavoritesController < ApplicationController
    before_action :authenticate_request
  
    # POST /favorites/:id
    # Creates a new favorite
    def create
      project = Project.find(params[:id])
      favorite = @current_user.favorites.find_by(project: project)
  
      if favorite
        render json: { status: 'error', message: 'Project already added to favorites.' }, status: :unprocessable_entity
      else
        favorite = @current_user.favorites.build(project: project)
        if favorite.save
          render json: { status: 'success', message: 'Project added to favorites.' }, status: :ok
        else
          render json: { status: 'error', message: favorite.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end
    end

    # GET /users/:user_id/favorites
    # List all favorites for a user
    def index
      user = User.find(params[:user_id])
      favorites = user.favorites.includes(:project)
  
      # Update this line to include the image_url
      favorites_with_image_url = favorites.map do |favorite|
        project_with_image_url(favorite.project)
      end
  
      render json: favorites_with_image_url, status: :ok
  end
  
  
    def project_with_image_url(project)
      project.as_json.merge(image_url: project.image.attached? ? url_for(project.image) : nil)
    end
    
    # DELETE /favorites/:id
    # Deletes a favorite by id
    def destroy
      project = Project.find(params[:id])
      favorite = @current_user.favorites.find_by(project: project)
      if favorite&.destroy
        render json: { status: 'success', message: 'Project removed from favorites.' }, status: :ok
      else
        render json: { status: 'error', message: 'Could not remove project from favorites or favorite not found.' }, status: :not_found
      end
    end
  
    private

    # Finds a favorite by id and sets it for the destroy action
    def set_favorite
      @favorite = @current_user.favorites.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Favorite not found.' }, status: :not_found
    end
  end
  
