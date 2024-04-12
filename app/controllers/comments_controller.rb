class CommentsController < ApplicationController
    before_action :set_project, only: [:create, :index, :update, :destroy]
    before_action :set_comment, only: [:update, :destroy]
  
    # GET /projects/:project_id/comments
    # List comments for a project
    def index
        @comments = @project.comments.includes(:user).map do |comment|
          comment.as_json(include: { user: { only: [:id, :name, :profile_picture_url] } })
        end
        render json: @comments
      end
      
    # POST /projects/:project_id/comments
    # Create a new comment for a project
    def create
      @comment = @project.comments.build(comment_params)
      @comment.user = current_user  
  
      if @comment.save
        render json: @comment, status: :created
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
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def set_comment
      @comment = @project.comments.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  