class Project < ApplicationRecord

# Associations
  belongs_to :user

  # Categories
 # has_many :category_joins
 # has_many :categories, through: :category_joins

  # Materials
 # has_many :material_join
 # has_many :materials, through: :material_joins

  # Tools
 # has_many :tool_joins
 # has_many :tools, through: :tool_joins

  # Project Materials and Project Tools
 # has_many :project_materials 
 # has_many :project_tools 

  
  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :est_time_to_completion, presence: true
  validates :is_favorite_project, inclusion: { in: [true, false] }
  validates :user_id, presence: true

end