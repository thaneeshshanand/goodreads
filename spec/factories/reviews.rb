FactoryBot.define do
  factory :review do
    content { FFaker::Lorem.paragraph }
    rating { rand(1..5) }
    association :user
    association :book

    trait :empty_content do
      content { "" }
    end

    trait :invalid_rating do
      rating { 7 }
    end
  end
end