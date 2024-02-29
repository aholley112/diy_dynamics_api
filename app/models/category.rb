class Category < ApplicationRecord

  # Associations
    has_many :category_joins
    has_many :projects, through: :category_joins

  # Validations
    validates :category_name, presence: true
    validates :description, presence: true
  end
  