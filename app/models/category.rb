class Category < ApplicationRecord
    has_many :category_joins
    has_many :projects, through: :category_joins
  end
  