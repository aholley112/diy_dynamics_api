require 'rails_helper'

RSpec.describe Category, type: :model do
    it { should have_and_belong_to_many(:projects) }
  
    # Validation tests
    it { should validate_presence_of(:category_name) }
    it { should validate_presence_of(:description) }
  
end
