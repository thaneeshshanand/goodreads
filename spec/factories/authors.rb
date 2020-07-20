FactoryBot.define do

  factory :author do
    name { "J K Rowling" }
    born { "Winterbourne, Gloucestershire" }
    website { "www.jkrowling.com" }
    genre { "Fantasy" }

    trait :empty_name do
      name { "" }
    end
  end

end