FactoryBot.define do
  factory :order_response, class: Patch::OrderResponse do
    success { true }
    error { {} }
    data { {} }
  end
end
