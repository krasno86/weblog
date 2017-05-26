class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create(user_id: current_user.id)
    redirect_to :back
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
    params.fetch(:like, {})
  end
end