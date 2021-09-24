# frozen_string_literal: true

FactoryBot.define do
  factory :technology_type, class: Patch::TechnologyType do
    slug { "reforestation" }
    name { "Reforestation" }
    association(:parent_technology_type)
  end
end
