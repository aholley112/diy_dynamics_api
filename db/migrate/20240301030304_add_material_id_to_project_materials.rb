class AddMaterialIdToProjectMaterials < ActiveRecord::Migration[7.1]
  def change
    add_reference :project_materials, :material, null: false, foreign_key: true
  end
end
