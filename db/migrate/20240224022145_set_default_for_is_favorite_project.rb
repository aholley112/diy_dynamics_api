class SetDefaultForIsFavoriteProject < ActiveRecord::Migration[7.1]
  def change
    change_column_default :projects, :is_favorite_project, from: nil, to: false
  end
end
