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
        render json: favorites.map { |favorite| favorite.project }
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
  
