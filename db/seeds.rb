# Users
User.create!(name:  "Thaneesh Shanand",
  email: "thaneeshshanand@gmail.com",
  password:              "password",
  password_confirmation: "password")

99.times do |n|
  name  = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end