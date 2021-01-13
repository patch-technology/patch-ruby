FactoryBot.define do
  factory :order_list_response, class: Patch::OrderListResponse do
    success { true }
    error { {} }
    data { {} }
    meta { {} }
  end
end
