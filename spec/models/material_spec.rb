require 'rails_helper'

RSpec.describe Material, type: :model do

  it { should have_many(:material_joins) }
  it { should have_many(:projects).through(:material_joins) }

  it { should validate_presence_of(:material_name) }
  it { should validate_presence_of(:description) }
end