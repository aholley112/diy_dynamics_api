class AddToolIdToProjectTools < ActiveRecord::Migration[7.1]
  def change
    add_column :project_tools, :tool_id, :integer
  end
end
