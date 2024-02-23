require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject { create(:user) }

    it 'validates presence and length of attributes' do
      is_expected.to validate_presence_of(:first_name)
      is_expected.to validate_presence_of(:last_name)
      is_expected.to validate_presence_of(:username)
      is_expected.to validate_presence_of(:email)
      is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(30)
      is_expected.to validate_length_of(:email).is_at_least(5).is_at_most(255)
    end

    it 'validates format of email' do
      is_expected.to allow_value('test@example.com').for(:email)
      is_expected.not_to allow_value('not-an-email').for(:email)
    end

    it 'validates uniqueness of email' do
      create(:user) 
      should validate_uniqueness_of(:email).case_insensitive
    end

    it 'validates uniqueness of username' do
      create(:user) 
      should validate_uniqueness_of(:username).case_insensitive
    end
  end

end

