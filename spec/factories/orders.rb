FactoryBot.define do
  factory :order, class: Patch::Order do
    sequence(:id) { |n| n }
    mass_g { 1_000 }
    production { false }
    state { "draft" }
    allocation_state { "pending" }
    price_cents_usd { 500 }
    patch_fee_cents_usd { 5 }
    metadata { {} }
  end
end
