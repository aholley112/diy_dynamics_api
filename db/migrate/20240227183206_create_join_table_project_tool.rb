class CreateJoinTableProjectTool < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projects, :tools do |t|
      t.index [:project_id, :tool_id]
      # t.index [:tool_id, :project_id]
    end
  end
end
