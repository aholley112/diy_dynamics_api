class ToolsController < ApplicationController
before_action :set_tool, only: [:show, :update, :destroy]

# GET /tools
# List all tools

def index
    @tools = Tool.all
    render json: @tools
end

# GET /tools/:id
# Show a specific tool

def show
    render json: @tool
end

# POST /tools
# Create a new tool

def create
    @tool = Tool.new(tool_params)
    if @tool.save
    render json: @tool, status: :created, location: @tool
    else
    render json: @tool.errors, status: :unprocessable_entity
    end
end

# PUT /tools/:id
# Update a tool

def update
if @tool.update(tool_params)
    head :no_content
  else
    render json: @tool.errors, status: :unprocessable_entity
  end
end

# DELETE /tools/:id
# Deletes a tool by id

def destroy
    @tool.destroy
    head :no_content
end

private
    
    # Finds a tool by id and sets it for the show, update and destroy actions

    def set_tool
    @tool = Tool.find(params[:id])
    end

    # Defines parameters
    def tool_params
    params.permit(:tool_name, :description, :tool_type)
    end
end

