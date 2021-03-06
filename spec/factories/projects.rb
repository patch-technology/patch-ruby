FactoryBot.define do
  factory :project, class: Patch::Project do
    sequence(:id) { |n| n }
    production { false }
    name { "New Project" }
    description { "New Descirption" }
    type { "biomass" }
    country { "DK" }
    developer { "Danish Developer" }
    photos { [] }
    average_price_per_tonne_cents_usd { 120 }
    remaining_mass_g { 1_000 }
    standard { 'european_biochar_certificate' }
  end
end
