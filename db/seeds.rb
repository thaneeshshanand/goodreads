# Users
User.create!(name:  "Thaneesh Shanand",
  email: "thaneeshshanand@gmail.com",
  password:              "password",
  password_confirmation: "password")

99.times do |n|
  password = "password"
  User.create!(name: FFaker::Name.name,
               email: "dummyuser+",
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

  # Books

  10.times do |m|
    title = FFaker::Book.title
    title_url_encoded = CGI.escape(title)
    book = Book.create!(name: title,
                 description: FFaker::Book.description,
                 rating: 1,
                 genre: genre,
                 author: author,
                 cover_pic: "https://via.placeholder.com/210x300/#{FFaker::Color.hex_code}/#{FFaker::Color.hex_code}.png?text=#{title_url_encoded}")
    
    # Reviews

    user_count = User.count
    user_offset = rand(user_count)
    users = User.limit(30).offset(user_offset)
    ratings = []
    users.each do |user|
      rating = rand(1..5)
      ratings.push(rating)
      Review.create!(content: FFaker::Lorem.paragraph,
                     rating: rating,
                     user: user,
                     book: book)
    end
    rating_avg = (ratings.inject(0) { |sum, r| sum + r }) / ratings.count
    book.update(rating: rating_avg)
  end
end

#Wishlist

book_count = Book.count
User.find_each do |user|
  offset = rand(book_count)
  books = Book.limit(20).offset(offset)
  books.each do |book|
    Wishlist.create(user: user, book: book)
  end
end