class BookMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.book_rating.subject
  #
  def book_rating(book, review)
    @user = user
    @book = book
    @review = review
    mail to: user.email, subject: "Wishlist Book Rated"
  end
end
