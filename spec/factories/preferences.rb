FactoryBot.define do
  factory :preference, class: Patch::Preference do
    sequence(:id) { |n| n }
    association :project
    allocation_percentage { 1 }
  end
end
