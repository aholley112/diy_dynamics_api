FactoryBot.define do
  factory :comment do
    text { "MyText" }
    user { nil }
    project { nil }
  end
end
