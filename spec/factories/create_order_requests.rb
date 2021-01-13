FactoryBot.define do
  factory :create_order_request, class: Patch::CreateOrderRequest do
    sequence(:project_id) { |n| n }
    mass_g { 100 }
    total_price_cents_usd { 100 }
    metadata { {} }
  end
end
