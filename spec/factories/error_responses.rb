FactoryBot.define do
  factory :error_response, class: Patch::ErrorResponse do
    success { true }
    error { {} }
    data { {} }
  end
end
