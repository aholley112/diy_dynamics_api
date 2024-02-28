class CreateJoinTableMatererialProject < ActiveRecord::Migration[7.1]
  def change
    create_join_table :materials, :projects do |t|
      t.index [:material_id, :project_id]
      # t.index [:project_id, :material_id]
    end
  end
end
