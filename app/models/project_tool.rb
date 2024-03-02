class ProjectTool < ApplicationRecord

  # Validations
  validates :quantity_needed, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }


  # Associations
  belongs_to :project
  belongs_to :tool

end
