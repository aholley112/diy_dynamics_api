class Project < ApplicationRecord

# Associations
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :likers, through: :likes, source: :user


# Categories
has_and_belongs_to_many :categories, join_table: 'categories_projects'

  # Materials
  has_and_belongs_to_many :materials, join_table: 'materials_projects'

  # Tools
  has_and_belongs_to_many :tools, 
  join_table: :projects_tools

  # Project Materials and Project Tools
  has_many :project_materials, dependent: :destroy
  has_many :project_tools, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :est_time_to_completion, presence: true
  validates :is_favorite_project, inclusion: { in: [true, false] }
  validates :user_id, presence: true

end