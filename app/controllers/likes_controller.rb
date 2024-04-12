class LikesController < ApplicationController
    before_action :set_project, only: [:create]
  
    def create
      like = @project.likes.new(user: current_user)
  
      if like.save
        render json: like, status: :created
      else
        render json: like.errors, status: :unprocessable_entity
      end
    end

   def destroy
    like = Like.find(params[:id])
    if like.destroy
      head :no_content
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end


   
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  end
  