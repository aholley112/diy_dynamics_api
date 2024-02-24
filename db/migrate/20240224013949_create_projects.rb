class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.boolean :is_favorite_project
      t.text :instructions
      t.string :est_time_to_completion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
