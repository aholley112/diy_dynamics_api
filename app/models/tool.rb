class Tool < ApplicationRecord

# Validations
validates :tool_name, presence: true
validates :description, presence: true

# Associations


has_and_belongs_to_many :projects, join_table: :tools_projects

end