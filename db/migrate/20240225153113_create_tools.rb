class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.text :tool_name
      t.text :description

      t.timestamps
    end
  end
end
