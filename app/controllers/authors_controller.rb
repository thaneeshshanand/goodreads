class AuthorsController < ApplicationController

  before_action :logged_in_user, only: [:index]

  def index
    @books = Author.order(:name).page params[:page]
  end

  def create
  end

  def show
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