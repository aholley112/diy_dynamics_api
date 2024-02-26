class ToolsController < ApplicationController
before_action :set_tool, only: [:show, :update, :destroy]

# GET /tools
def index
    @tools = Tool.all
    render json: @tools
end

# GET /tools/:id
def show
    render json: @tool
end

# POST /tools
def create
    @tool = Tool.new(tool_params)
    if @tool.save
    render json: @tool, status: :created, location: @tool
    else
    render json: @tool.errors, status: :unprocessable_entity
    end
end

# PATCH/PUT /tools/:id
def update
if @tool.update(tool_params)
    head :no_content
  else
    render json: @tool.errors, status: :unprocessable_entity
  end
end


# DELETE /tools/:id
def destroy
    @tool.destroy
    head :no_content
end

private
    
    def set_tool
    @tool = Tool.find(params[:id])
    end

    def tool_params
    params.require(:tool).permit(:tool_name, :description, :tool_type)
    end
end

