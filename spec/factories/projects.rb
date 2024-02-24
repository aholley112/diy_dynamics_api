FactoryBot.define do
  factory :project do
    title { "MyString" }
    description { "MyText" }
    is_favorite_project { false }
    instructions { "MyText" }
    est_time_to_completion { "MyString" }
    user { nil }
  end
end
