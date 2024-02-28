FactoryBot.define do
  factory :project_tool do
    quantity_needed { 1 }
    price { 1 }
    project { nil }
  end
end
