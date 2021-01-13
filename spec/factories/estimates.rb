FactoryBot.define do
  factory :estimate, class: Patch::Estimate do
    sequence(:id) { |n| n }
    association :order
    production { false }
    type { "mass" }
  end
end
