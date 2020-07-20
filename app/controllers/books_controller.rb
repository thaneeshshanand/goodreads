class BooksController < ApplicationController

  before_action :logged_in_user, only: [:index]

  def index
    if params[:search].blank?
      @books = Book.order(:name).page params[:page]
    else
      @parameter = params[:search].downcase
      @books = Book.order(:name).where("lower(name) LIKE :search", search: "%#{@parameter}%").page
    end
  end

  def create
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
  end

  def update
  end

  def destroy
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