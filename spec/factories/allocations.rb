FactoryBot.define do
  factory :allocation, class: Patch::Allocation do
    sequence(:id) { |n| n }
    production { false }
    mass_g { 100 }
  end
end
