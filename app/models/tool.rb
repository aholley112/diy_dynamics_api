class Tool < ApplicationRecord

# Validations
validates :tool_name, presence: true
validates :description, presence: true

# Associations

# NEED TO CHECK ON THESE ASSOCIATIONS WITH A COACH
#has_many :tool_joins 
#has_many :projects, through: :tool_joins 

end