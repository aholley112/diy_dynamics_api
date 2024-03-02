class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    # GET /categories
    # List all categories
    def index
      @categories = Category.all
      render json: @categories
    end
  
    # GET /categories/:id
    # Show a specific category
    def show
      render json: @category
    end
  
    # POST /categories
    # Create a new category
    def create
      @category = Category.new(category_params)
      if @category.save
        render json: @category, status: :created
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /categories/:id
    # Update a category
    def update
      @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /categories/:id
    # Deletes a category by id
    def destroy
      @category.destroy
      render json: { message: "Category successfully deleted." }, status: :ok
    end
  
    private
  
    # Finds a category by id and sets it for the show, update, and destroy actions
    def set_category
      @category = Category.find(params[:id])
    end
  
    # Defines parameters
    def category_params
      params.permit(:category_name, :description)
    end
  


end
