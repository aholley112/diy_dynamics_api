class LikesController < ApplicationController
    before_action :set_project, only: [:create]
  
      # POST /projects/:project_id/likes
  # Creates a new like associated with a project for the current user.
 def create
      like = @project.likes.new(user: current_user)
  
      if like.save
        render json: like, status: :created
      else
        render json: like.errors, status: :unprocessable_entity
      end
    end

    # DELETE /likes/:id
  # Deletes a specific like by its ID.

   def destroy
    like = Like.find(params[:id])
    if like.destroy
      head :no_content
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

    private
  
     # Sets the @project instance variable based on the project_id passed in the request parameters.
     
    def set_project
      @project = Project.find(params[:project_id])
    end
  end
  