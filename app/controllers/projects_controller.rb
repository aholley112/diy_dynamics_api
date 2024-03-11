class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :show] 
  
    # GET /projects
    # List all projects

    def index
      @projects = Project.all
      render json: @projects, status: :ok
    end
  
      def index_by_category
        category = Category.find(params[:category_id])
        projects = category.projects
        render json: projects, include: :categories
      end

      def upload_image
        project = Project.find(params[:id])
    
        if project.image.attach(params[:image])
          render json: { message: "Image successfully uploaded." }, status: :ok
        else
          render json: { message: "Image upload failed." }, status: :unprocessable_entity
        end
      end
      
    # GET /projects/:id
    # Show a specific project

    def show
      project = Project.find(params[:id])
      project_data = project.as_json
      project_data[:image_url] = url_for(project.image) if project.image.attached?
      render json: project_data
    end
  
    # POST /projects
    # Create a new project

    def create
      @project = Project.new(project_params)
  
      if @project.save
        render json: @project, status: :created
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /projects/:id
    # Update a project

    def update
      if @project.update(project_params)
        render json: @project, status: :ok
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
  
    # def toggle_favorite
    #   project = current_user.projects.find(params[:id])
    #   if project.update(is_favorite_project: !project.is_favorite_project)
    #     render json: project
    #   else
    #     render json: project.errors, status: :unprocessable_entity
    #   end
    # end

    # DELETE /projects/:id
    # Delete a project

    def destroy
      @project.destroy
      render json: { message: "Project successfully deleted." }, status: :ok
    end
    
  
    private
  
    # Finds a project by id and sets it for the show, update and destroy actions

    def set_project
      @project = Project.find(params[:id])
    end
  
    # Defines parameters
    def project_params
      params.permit(:title, :description, :is_favorite_project, :instructions, :est_time_to_completion, :user_id)
    end
  end
  