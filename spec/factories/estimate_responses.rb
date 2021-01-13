FactoryBot.define do
  factory :estimate_response, class: Patch::EstimateResponse do
    success { true }
    error { {} }
    data { {} }
  end
end
