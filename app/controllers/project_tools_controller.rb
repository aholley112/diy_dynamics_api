class ProjectToolsController < ApplicationController
    before_action :set_project_tool, only: [:show, :update, :destroy]
  
    # GET /project_tools
    # List all project tools

    def index
      @project_tools = ProjectTool.all
      render json: @project_tools
    end
  
    # GET /project_tools/:id
    # Show a specific project tool 

    def show
      render json: @project_tool
    end
  
    # POST /project_tools
    # Create a new project tool 

    def create
      @project_tool = ProjectTool.new(project_tool_params)
  
      if @project_tool.save
        render json: @project_tool, status: :created
      else
        render json: @project_tool.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /project_tools/:id
    # Update a project tool 

    def update
      if @project_tool.update(project_tool_params)
        render json: @project_tool, status: :ok
      else
        render json: @project_tool.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /project_tools/:id
    # Deletes a project tool 

    def destroy
      @project_tool.destroy
      head :no_content
    end
  
    private
  
    # Finds a project tool by id and sets it for the show, update, and destroy actions

    def set_project_tool
      @project_tool = ProjectTool.find(params[:id])
    end
  
    # Defines parameters

    def project_tool_params
      params.permit(:project_id, :tool_id, :price, :quantity_needed) 
    end
  end
  