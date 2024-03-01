class Category < ApplicationRecord
  # Associations
  has_and_belongs_to_many :projects, join_table: :categories_projects

  # Validations
  validates :category_name, presence: true
  validates :description, presence: true
end
