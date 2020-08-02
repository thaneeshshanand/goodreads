class ReviewsController < ApplicationController

  before_action :logged_in_user, only: [:index]

  def index
    @reviews = Review.order(:created_at).page params[:page]
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.create(book_id: @book.id,
                            user_id: current_user.id,
                            rating: params[:review][:rating],
                            content: params[:review][:content])

    RatingsAverageJob.perform_later(@book)
    RatingsMailJob.perform_later(@book, @review)
    redirect_to @book
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end


end