class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]

  # GET /materials
  # List all materials

  def index
    @materials = Material.all
    render json: @materials
  end

  # GET /materials/:id. 
  # Show a specific material

  def show
    render json: @material
  end

  # POST /materials. 
  # Create a new material

  def create
    @material = Material.new(material_params)
    if @material.save
      render json: @material, status: :created, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PUT /materials/:id. 
  # Update a material

  def update
    if @material.update(material_params)
      render json: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/:id
  # Deletes a material by id
  def destroy
    @material.destroy
    head :no_content
  end

  private
    
  # Finds a material by id and sets it for the show, update and destroy actions

  def set_material
    @material = Material.find(params[:id])
  end

  # Defines parameters 
  
  def material_params
    params.permit(:material_name, :description)
  end
end
