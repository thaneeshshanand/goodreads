class BooksController < ApplicationController

  before_action :logged_in_user, only: [:index]

  def index
    if params[:search].blank?
      @books = Book.order(:name).page params[:page]
    else
      @books = Book.filter(params: params.permit!, filter: BookFilter).page params[:page]
    end
  end

  # /simple/users?utf8=✓&wf_id=&wf_type=WillFilter::Filter&wf_dirty=false&wf_submitted=true&
  # wf_name=&wf_model=User&wf_export_format=&wf_export_fields=&wf_key=&wf_match=all&
  # wf_order=sex&wf_order_type=desc&wf_per_page=100

  def create
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.order(created_at: :desc).page params[:page]
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  def wish
    book = Book.find(params[:id])
    Wishlist.create(user: current_user, book: book)
    redirect_to request.referrer
  end

  def unwish
    book = Book.find(params[:id])
    Wishlist.find_by(user: current_user, book: book).destroy
    redirect_to request.referrer
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