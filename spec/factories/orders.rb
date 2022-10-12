FactoryBot.define do
  factory :order, class: Patch::Order do
    sequence(:id) { |n| n }
    amount { 1_000 }
    unit { "g" }
    production { false }
    state { "draft" }
    price { 500 }
    patch_fee { 5 }
    currency { "USD" }
    metadata { {} }
  end
end
