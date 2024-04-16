class AddProjectIdsToPlanner < ActiveRecord::Migration[7.1]
  def change
    add_column :planners, :project_ids, :text
  end
end
