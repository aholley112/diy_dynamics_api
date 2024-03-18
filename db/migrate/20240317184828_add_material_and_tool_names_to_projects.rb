class AddMaterialAndToolNamesToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :material_names, :text
    add_column :projects, :tool_names, :text
  end
end
