class ProjectMaterial < ApplicationRecord

  # Associations
  
  belongs_to :project
  belongs_to :material

  # Validations

  
  validates :quantity_needed, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :project_id, presence: true
  validates :material_id, presence: true

 
end
