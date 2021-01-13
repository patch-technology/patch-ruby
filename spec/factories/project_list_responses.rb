FactoryBot.define do
  factory :project_list_response, class: Patch::ProjectListResponse do
    success { true }
    error { {} }
    data { {} }
    meta { {} }
  end
end
