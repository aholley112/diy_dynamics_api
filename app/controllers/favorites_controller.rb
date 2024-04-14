class FavoritesController < ApplicationController
  before_action :authenticate_request
  before_action :set_favorite, only: [:update_status, :destroy]

  # POST /favorites/:id
  # Creates a new favorite
  def create
    project = Project.find(params[:id])
    favorite = @current_user.favorites.find_by(project: project)
  
    if favorite
      render json: { status: 'error', message: 'Project already added to favorites.' }, status: :unprocessable_entity
    else
      favorite = @current_user.favorites.build(project: project, status: 'wantToDo') 
      if favorite.save
        render json: { status: 'success', message: 'Project added to favorites.', favorite_id: favorite.id }, status: :ok
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
  
    favorites_with_image_url = favorites.map do |favorite|
      project_with_image_url(favorite)  
    end
  
    render json: favorites_with_image_url, status: :ok
  end

 # Include URL, favorite_id, and status in the project JSON
  def project_with_image_url(favorite)
    favorite.project.as_json.merge(
      image_url: favorite.project.image.attached? ? url_for(favorite.project.image) : nil,
      favorite_id: favorite.id, 
      status: favorite.status  
    )
  end
  
  
  # DELETE /favorites/:id
  # Deletes a favorite by id
  def destroy
    if @favorite.destroy
      render json: { success: true, message: 'Favorite removed' }, status: :ok
    else
      render json: { error: 'Failed to remove favorite' }, status: :unprocessable_entity
    end
  end

 # PUT /favorites/:id/status
  # Updates the status of a favorite in the drop down 
  
def update_status
  puts "Updating status to #{params[:status]} for favorite #{params[:id]}"

  if @favorite.update(status: params[:status])
    render json: { success: true, message: "Favorite status updated." }
  else
    render json: { success: false, message: "Failed to update favorite status.", errors: @favorite.errors.full_messages }, status: :unprocessable_entity
  end
end

  private
  

  # Finds a favorite by id and sets it for the destroy action
  def set_favorite
    @favorite = @current_user.favorites.find_by(id: params[:id])
    unless @favorite
      render json: { error: 'Favorite not found.' }, status: :not_found
    end
  end
end