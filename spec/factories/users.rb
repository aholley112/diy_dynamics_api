FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'User' }
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
  end
end
