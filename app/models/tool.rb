class Tool < ApplicationRecord

# Validations
validates :tool_name, presence: true
validates :description, presence: true

# Associations


has_many :tool_joins 
has_many :projects, through: :tool_joins 

end