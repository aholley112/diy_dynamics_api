class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit, :destroy, :add_to_favorites]
  before_action :check_owner, only: [:edit, :update]
  skip_before_action :authenticate_request, only: [:index, :index_by_category] 
  

  # GET /projects
  # List all projects

  def index
    @projects = Project.all
    projects_with_image_url = @projects.map do |project|
      project.as_json.merge(image_url: project.image.attached? ? url_for(project.image) : nil)
    end
    render json: projects_with_image_url, status: :ok
  end

    def index_by_category
      category = Category.find(params[:id]) 
      projects = category.projects
      projects_with_image_url = projects.map do |project|
        project.as_json.merge(image_url: project.image.attached? ? url_for(project.image) : nil)
      end
      render json: projects_with_image_url
    
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
  
    @project = Project.find(params[:id])
  project_data = @project.as_json
  project_data[:image_url] = url_for(@project.image) if @project.image.attached?
  project_data[:user_id] = @project.user_id

  favorite = current_user&.favorites&.find_by(project_id: @project.id)
  project_data[:is_favorite_project] = favorite.present?
  project_data[:favorite_id] = favorite&.id

  puts "Current User ID: #{current_user&.id}"
  puts "Favorite: #{favorite.inspect}"

  render json: project_data
  end

  def add_to_favorites
    current_user = User.find(params[:user_id])  
    favorite = current_user.favorites.create(project: @project)

    if favorite.persisted?
      render json: { message: "Project successfully added to favorites." }, status: :ok
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  # POST /projects
  # Create a new project

  def create
    @project = Project.new(project_params)
    
    if @project.save
      category = Category.find_by(id: params[:category_id])
      @project.categories << category if category
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  
  def search
    query = params[:query]
    @projects = Project.where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
    projects_with_image_url = @projects.map do |project|
      project.as_json.merge(image_url: project.image.attached? ? url_for(project.image) : nil)
    end
    render json: projects_with_image_url
  end

  # PUT /projects/:id
  # Update a project

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @project.update(project_params)

    if params[:category_id]
      new_category = Category.find_by(id: params[:category_id])
      if new_category
        @project.categories.clear
        @project.categories << new_category
      end
    end
    render json: @project, status: :ok
  else
    render json: @project.errors, status: :unprocessable_entity
  end
end

  # DELETE /projects/:id
  # Delete a project

  def destroy
    @project.destroy
    render json: { message: "Project successfully deleted." }, status: :ok
  end
  

  private

  def check_owner
    unless @project.user_id == current_user.id
      render json: { error: 'You are not authorized to edit this project.' }, status: :forbidden
    end
  end

  # Finds a project by id and sets it for the show, update and destroy actions

  def set_project
    @project = Project.find(params[:id])
  end

  # Defines parameters
  def project_params
    params.permit(:user_id, :title, :description, :instructions, :est_time_to_completion, :material_names, :tool_names, :image)
  end
end