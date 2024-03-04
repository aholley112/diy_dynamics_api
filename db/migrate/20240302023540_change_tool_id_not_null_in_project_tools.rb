class ChangeToolIdNotNullInProjectTools < ActiveRecord::Migration[7.1]
  def change
    change_column_null :project_tools, :tool_id, false
  end
end
