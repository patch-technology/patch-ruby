FactoryBot.define do
  factory :create_order_request, class: Patch::CreateOrderRequest do
    sequence(:project_id) { |n| n }
    amount { 100 }
    unit { "g" }
    total_price { 100 }
    currency { "USD" }
    metadata { {} }
  end
end
