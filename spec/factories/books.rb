FactoryBot.define do
  factory :book do
    name { "Harry Potter" }
    description { "Adventures of a boy in magic school" }
    rating { 5 }
    association :author

    trait :empty_name do
      name { "" }
    end

    trait :empty_author do
      author { nil }
    end
  end
end