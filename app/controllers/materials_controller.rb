class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]

  # GET /materials
  def index
    @materials = Material.all
    render json: @materials
  end

  # GET /materials/:id
  def show
    render json: @material
  end

  # POST /materials
  def create
    @material = Material.new(material_params)
    if @material.save
      render json: @material, status: :created, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/:id
  def update
    if @material.update(material_params)
      head :no_content
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/:id
  def destroy
    @material.destroy
  end

  private
    
    def set_material
      @material = Material.find(params[:id])
    end

    def material_params
      params.require(:material).permit(:material_name, :description)
    end
end
