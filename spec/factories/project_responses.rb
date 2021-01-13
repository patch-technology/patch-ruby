FactoryBot.define do
  factory :project_response, class: Patch::ProjectResponse do
    success { true }
    error { {} }
    data { {} }
  end
end
