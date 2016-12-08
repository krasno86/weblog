class EventsController < ApplicationController

  #before_filter :authenticate_user!

  def index
    @users = User.all
#@comments = Comment.includes(:user, picture: :category).order('created_at ASC').page(params[:page]).per 10
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end