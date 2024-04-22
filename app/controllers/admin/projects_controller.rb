module Admin
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:destroy]
      before_action :authenticate_admin
  
      # DELETE /admin/projects/:id
      # Delete a project
      def destroy
        if @project.destroy
          redirect_to admin_projects_url, notice: 'Project was successfully destroyed.'
        else
          render json: { error: 'Failed to destroy the project' }, status: :unprocessable_entity
        end
      end
  
      private
  
      # Finds a project based on the 'id' parameter
      def set_project
        @project = Project.find(params[:id])
      end
    end
  end
  
  