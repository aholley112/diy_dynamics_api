class AddStatusToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :status, :string
  end
end
