class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :project_id, uniqueness: { scope: :user_id }
  validates :status, presence: true
end
