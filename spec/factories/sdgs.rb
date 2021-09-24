# frozen_string_literal: true

FactoryBot.define do
  factory :sdg, class: Patch::Sdg do
    description { "Take urgent action to combat climate change and its impacts." }
    number { 13 }
    title { "Climate Action" }
    url { "https://sdgs.un.org/goals/goal13" }
  end
end
