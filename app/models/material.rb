class Material < ApplicationRecord
  
  # Validations

  validates :material_name, presence: true
  validates :description, presence: true


  # Associations 
  
  has_and_belongs_to_many :projects, join_table: :materials_projects
 
  
end