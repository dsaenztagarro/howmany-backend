FactoryGirl.define do
  factory :event_type do
    sequence(:title) { |n| "Event type #{n}" }
  end
end
