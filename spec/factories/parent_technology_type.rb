# frozen_string_literal: true

FactoryBot.define do
  factory :parent_technology_type, class: Patch::ParentTechnologyType do
    slug { "forestry" }
    name { "Forestry" }
  end
end
