module ProjectsService
  class Main
    include Rails.application.routes.url_helpers

    def initialize(user:, request:)
      @user = user
      @request = request
    end

    def create(params)
      project = Project.new(params.except(:user_id, :category_id, :image))
      project.user = @user

      # Handle category association
      category = Category.find_by(id: params[:category_id])
      project.categories << category if category

      # Handle image attachment
      project.image.attach(params[:image]) if params[:image].present?

      if project.save
        project
      else
        { errors: project.errors.full_messages }
      end
    end


    def list_all
      Project.all.map { |project| format_project(project) }
    end

    def list_by_category(category_id)
      Category.find(category_id).projects.map { |project| format_project(project) }
    end

    def search(query)
      projects = Project.where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
      projects.map { |project| format_project(project) }
    end
  

    def show(project_id)
      project = Project.find(project_id)
      format_project(project)
    end

    def update(project, params)
      # Update the project with the provided params
      if project.update(params.except(:category_id, :image))
        Rails.logger.info "updated project: #{project.attributes}"
        # Handle category association if provided
        if params[:category_id].present?
          category = Category.find_by(id: params[:category_id])
          project.categories = [category] if category
        end

        # Handle image attachment if provided
        project.image.attach(params[:image]) if params[:image].present?

        format_project(project)
      else
        Rails.logger.error "Update failed: #{project.errors.full_messages}"
        { errors: project.errors.full_messages }
      end
    end
    

    private

    def format_project(project)
    project_data = project.as_json
    if project.image.attached?
      project_data[:image_url] = rails_blob_url(project.image, disposition: "attachment", host: @request.host_with_port)
    end
    favorite = @user.favorites.find_by(project_id: project.id)
    project_data.merge!(
      is_favorite_project: favorite.present?,
      favorite_id: favorite&.id
    )
    project_data
  end    
  end
end
