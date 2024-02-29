class ProjectMaterial < ApplicationRecord

  # Associations
  
  belongs_to :project
  belongs_to :material

  # Validations

  validates :quantity, presence: true
  validates :price, presence: true
  validates :project_id, presence: true
  validates :material_id, presence: true

end
