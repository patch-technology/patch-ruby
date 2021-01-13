FactoryBot.define do
  factory :preference_list_response, class: Patch::PreferenceListResponse do
    success { true }
    error { {} }
    data { {} }
    meta { {} }
  end
end
