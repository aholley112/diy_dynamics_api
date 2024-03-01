require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'associations' do
    it { should have_and_belong_to_many(:projects) }
  end


  describe 'validations' do
    it { should validate_presence_of(:category_name) }
    it { should validate_presence_of(:description) }
  end
end