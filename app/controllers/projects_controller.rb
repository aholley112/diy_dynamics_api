class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :show] 
  
    # List all projects
    def index
      projects = Project.all
      render json: projects, status: :ok
    end
  
    # Show a specific project
    def show
      render json: @project, status: :ok
    end
  
    # Create a new project
    def create
      project = Project.new(project_params)
  
      if project.save
        render json: project, status: :created
      else
        render json: project.errors, status: :unprocessable_entity
      end
    end
  
    # Update a project
    def update
      if @project.update(project_params)
        render json: @project, status: :ok
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
  
    # Delete a project
    def destroy
      if @project.destroy
        head :no_content
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:title, :description, :is_favorite_project, :instructions, :est_time_to_completion, :user_id)
    end
  end
  