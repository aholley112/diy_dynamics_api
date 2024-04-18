module Admin
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /admin/categories
    # Lists all categories
    def index
      @categories = Category.all
    end

    # GET /admin/categories/new
    # Initializes a new category
    def new
      @category = Category.new
    end

    # POST /admin/categories
    # Creates a new category from the form parameters
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to [:admin, @category], notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/categories/:id
    # Update a category
    def update
      if @category.update(category_params)
        redirect_to [:admin, @category], notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/categories/:id
    # Delete a category
    def destroy
      @category.destroy
      redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
    end

    private

      # Finds a category based on the 'id' parameter
      def set_category
        @category = Category.find(params[:id])
      end

      # Paramaters 
      def category_params
        params.require(:category).permit(:title)
      end
  end
end
