# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/book_mailer/book_rating
  def book_rating
    user = User.first
    BookMailer.book_rating(user)
  end

end
