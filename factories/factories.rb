FactoryGirl.define do
  factory :event_type_attribute do
    sequence(:name) { |n| "Event type attribute #{n}" }
    value_type 'Integer'

    trait :integer do
      value_type 'Integer'
    end
    trait :string do
      value_type 'String'
    end
  end

  factory :event_type_attribute_relation do
    event_type
    event_type_attribute
  end

  factory :event_type do
    sequence(:title) { |n| "Event type #{n}" }
    transient do
      attributes_count 0
    end
    after(:create) do |event_type, evaluator|
      create_list :event_type_attribute_relation, evaluator.attributes_count,
                  event_type: event_type
    end
  end
end
