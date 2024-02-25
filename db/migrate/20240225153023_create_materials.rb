class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.text :material_name
      t.text :description

      t.timestamps
    end
  end
end
