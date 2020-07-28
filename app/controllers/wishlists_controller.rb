class WishlistsController < ApplicationController

  before_action :logged_in_user, only: [:index]

  def index
    @books = Wishlist.where(user_id: current_user.id).map { |wish| wish.book }
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