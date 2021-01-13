FactoryBot.define do
  factory :create_preference_request, class: Patch::CreatePreferenceRequest do
    sequence(:project_id) { |n| n }
  end
end
