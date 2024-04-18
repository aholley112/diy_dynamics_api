class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :check_owner, only: [:update, :destroy]

  # GET /projects
  # Lists all projects using a service to format and handle business logic.
  def index
    service = ProjectsService::Main.new(user: current_user, request: request)
    render json: service.list_all, status: :ok
  end
  
  # GET /projects/:id
  # Shows a single project using a service to handle retrieval and formatting.
  def show
    service = ProjectsService::Main.new(user: current_user, request: request)
    render json: service.show(params[:id]), status: :ok
  end

   # GET /projects/category/:id
  # Lists projects by category, using a service to filter and format the projects.
  def index_by_category
    service = ProjectsService::Main.new(user: current_user, request: request)
    render json: service.list_by_category(params[:id]), status: :ok
  end

  # GET 
  # Searches projects by title or description.
  def search
    service = ProjectsService::Main.new(user: current_user, request: request)
    render json: service.search(params[:query]), status: :ok
  end

  # POST /projects
  # Creates a new project.
  def create
    service = ProjectsService::Main.new(user: current_user, request: request)
    project = service.create(project_params)
    if project.is_a?(Hash) && project[:errors]
      render json: { errors: project[:errors] }, status: :unprocessable_entity
    else
      render json: project, status: :created
    end
  end

# PUT /projects/:id
# Updates a project.
def update
  service = ProjectsService::Main.new(user: current_user, request: request)
  result = service.update(@project, project_params)
  
  if result.is_a?(Hash) && result[:errors]
    render json: { errors: result[:errors] }, status: :unprocessable_entity
  else
    render json: result, status: :ok
  end
end

 # DELETE /projects/:id
 # Deletes a project.
  def destroy
    service = ProjectsService::Main.new(user: current_user, request: request)
    service.destroy(@project)
    render json: { message: "Project successfully deleted." }, status: :ok
  end

  private

  # Finds a project by id and sets it for the show, update, and destroy actions
  def set_project
    @project = Project.find(params[:id])
  end

  # Checks if the current user is the owner of the project
  def check_owner
    render json: { error: 'You are not authorized to edit this project.' }, status: :forbidden unless @project.user_id == current_user.id
  end

  # Parameters
  def project_params
    params.permit(:title, :description, :instructions, :est_time_to_completion, :material_names, :tool_names, :image, :category_id)
  end
end
