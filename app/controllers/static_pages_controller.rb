class StaticPagesController < ApplicationController

  def home
    @user = User.new if @user.nil?
    @current_user = current_user
  end

  def help
  end

end