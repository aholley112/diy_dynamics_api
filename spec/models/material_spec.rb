require 'rails_helper'

RSpec.describe Material, type: :model do

 # it { should belong_to(:project) } 

  it { should validate_presence_of(:material_name) }
  it { should validate_presence_of(:description) }
end