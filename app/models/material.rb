class Material < ApplicationRecord
  
  # Validations

  validates :material_name, presence: true
  validates :description, presence: true

  # Associations 
  
 
  has_many :material_joins
  has_many :projects, through: :material_joins
  
end