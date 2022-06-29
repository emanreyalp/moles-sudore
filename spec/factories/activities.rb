FactoryBot.define do
  factory :activity do
    name { 'Name' }
    before_weight { 80 }
    after_weight { 80 }
    date { Time.now }
    description { 'Random description' }

    trait :bring_water do
      before_weight_with_water { 82 }
    end

    trait :dont_bring_back_water do
      bring_water

      after_weight_with_water { 80 }
    end

    trait :not_bring_water do
      after(:build) do |activity|
        activity.before_weight_with_water = activity.before_weight
        activity.after_weight_with_water = activity.after_weight
      end
    end
  end
end