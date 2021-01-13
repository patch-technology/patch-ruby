FactoryBot.define do
  factory :meta_index_object, class: Patch::MetaIndexObject do
    sequence(:next_page) { |n| n + 1 }
    sequence(:prev_page) { |n| n - 1 }
  end
end
