# Users
User.create!(name:  "Thaneesh Shanand",
  email: "thaneeshshanand@gmail.com",
  password:              "password",
  password_confirmation: "password")

99.times do |n|
  name = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

# Authors

10.times do |n|
  genre = FFaker::Book.genre
  author = Author.create!(name: FFaker::Name.name,
                 born: "#{FFaker::Address.street_name}, #{FFaker::Address.city}, #{FFaker::Address.country}",
                 website: FFaker::Internet.http_url,
                 genre: genre,
                 created_at: FFaker::Time.datetime)
  10.times do |m|
    Book.create!(name: FFaker::Book.title,
                 description: FFaker::Book.description,
                 rating: rand(1..5),
                 genre: genre,
                 author: author,
                 cover_pic: FFaker::Book.cover)
  end
end



