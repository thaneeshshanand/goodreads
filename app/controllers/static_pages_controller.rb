class StaticPagesController < ApplicationController

  def home
    @user = User.new if @user.nil?
  end

  def help
  end

end