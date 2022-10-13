FactoryBot.define do
  factory :project, class: Patch::Project do
    sequence(:id) { |n| n }
    association(:technology_type)
    sdgs { build_list(:sdg, 1) }

    production { false }
    name { "New Project" }
    description { "New Descirption" }
    country { "DK" }
    project_partner { "Danish Developer" }
    photos { [] }
    standard { 'european_biochar_certificate' }
    state { 'CO' }
    latitude { 45.0 }
    longitude { 45.0 }
    mechanism { 'removal' }
  end
end
