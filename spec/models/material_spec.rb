require 'rails_helper'

RSpec.describe Material, type: :model do

  it { should have_and_belong_to_many(:projects) }

  it { should validate_presence_of(:material_name) }
  it { should validate_presence_of(:description) }
end