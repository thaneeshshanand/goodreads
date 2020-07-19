FactoryBot.define do

  factory :user do
    name { 'Bruce Wayne' }
    email { 'batman@gmail.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }

    trait :empty_name do
      name { "" }
    end
    
    trait :empty_email do
      email { "" }
    end

    trait :mixed_email do
      email { "BATman@gmail.com" }
    end

    trait :admin do
      admin { true }
    end
  end

  factory :other_user, class: User do
    name { 'Arthur' }
    email { 'joker@gmail.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end