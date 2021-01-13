FactoryBot.define do
  factory :create_mass_estimate_request, class: Patch::CreateMassEstimateRequest do
    sequence(:project_id) { |n| n }
    mass_g { 100 }
  end
end
