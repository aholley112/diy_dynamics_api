class CommentsController < ApplicationController
  include Rails.application.routes.url_helpers
    before_action :set_project, only: [:create, :index, :update, :destroy]
    before_action :set_comment, only: [:update, :destroy]
  
    # GET /projects/:project_id/comments
    # List comments for a project
    def index
      @comments = @project.comments.includes(user: :profile).map do |comment|
          user = comment.user
          profile = user.profile
          {
              id: comment.id,
              text: comment.text,
              user_id: user.id,
              project_id: @project.id,
              created_at: comment.created_at,
              updated_at: comment.updated_at,
              user: {
                id: current_user.id,
                username: current_user.username,
                first_name: current_user.first_name,
                last_name: current_user.last_name,
                profile_picture_url: current_user.profile&.profile_picture.attached? ? url_for(current_user.profile.profile_picture) : nil
              }
          }
      end
      render json: @comments
  end
      
    # POST /projects/:project_id/comments
    # Create a new comment for a project
    def create
      @comment = @project.comments.build(comment_params)
      @comment.user = current_user
    
      if @comment.save
        render json: {
          id: @comment.id,
          text: @comment.text,
          user: {
            id: current_user.id,
            username: current_user.username,
            first_name: current_user.first_name,
            last_name: current_user.last_name,
            profile_picture_url: current_user.profile&.profile_picture.attached? ? url_for(current_user.profile.profile_picture) : nil
          }
        }, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
    
  
    # PUT /projects/:project_id/comments/:id
    # Update a comment
    def update
      if @comment.update(comment_params)
        render json: @comment, status: :ok
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /projects/:project_id/comments/:id
    # Delete a comment
    def destroy
      @comment.destroy
      render json: { message: 'Comment deleted successfully' }, status: :ok
    end
  
    private
  
    # Set the project for the comment
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    # Set the comment for the update and destroy actions
    def set_comment
      @comment = @project.comments.find(params[:id])
    end
  
    # Paramaters 
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  