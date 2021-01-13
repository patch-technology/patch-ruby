FactoryBot.define do
  factory :estimate_list_response, class: Patch::EstimateListResponse do
    success { true }
    error { {} }
    data { {} }
    meta { {} }
  end
end
