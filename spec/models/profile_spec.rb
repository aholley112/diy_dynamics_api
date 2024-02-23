require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:bio) }

    it 'is valid with a bio and a user association' do
      user = FactoryBot.create(:user)
      profile = Profile.new(bio: "Lorem ipsum", user: user)
      expect(profile).to be_valid
    end
  end
end
