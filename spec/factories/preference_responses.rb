FactoryBot.define do
  factory :preference_response, class: Patch::PreferenceResponse do
    success { true }
    error { {} }
    data { {} }
  end
end
