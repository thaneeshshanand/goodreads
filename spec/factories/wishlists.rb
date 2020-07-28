FactoryBot.define do
  factory :wishlist do
    association :user
    association :book

    trait :empty_user do
      user_id { "" }
    end

    trait :empty_book do
      book_id { "" }
    end

  end
end