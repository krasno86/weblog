class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create(like_params)
    redirect_to :back
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_like
  @like = Like.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def like_params
  params.fetch(:like, {})
  end
end