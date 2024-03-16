class AddProfilePictureToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :profile_picture, :string
  end
end
