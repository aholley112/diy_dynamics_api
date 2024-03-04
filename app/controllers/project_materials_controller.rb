class ProjectMaterialsController < ApplicationController
  before_action :set_project_material, only: [:show, :update, :destroy]

  # GET /project_materials
  # List all project materials
  def index
    @project_materials = ProjectMaterial.all
    render json: @project_materials
  end

  # GET /project_materials/:id
  # Show a specific project material by id
  def show
    render json: @project_material
  end

  # POST /project_materials
  # Create a new project material
  def create
    @project_material = ProjectMaterial.new(project_material_params)

    if @project_material.save
      render json: @project_material, status: :created
    else
      render json: @project_material.errors, status: :unprocessable_entity
    end
  end

  # PUT /project_materials/:id
  # Update a project material
  def update
    if @project_material.update(project_material_params)
      render json: @project_material
    else
      render json: @project_material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_materials/:id
  # Delete a project material
  def destroy
    @project_material.destroy
    render json: { message: "Project material successfully deleted." }, status: :ok
  end

  private

  # Finds a project material by id and sets it for the show, update, and destroy actions
  def set_project_material
    @project_material = ProjectMaterial.find(params[:id])
  end

  # Defines parameters
  def project_material_params
    params.permit(:quantity_needed, :price, :project_id, :material_id)
  end
end
