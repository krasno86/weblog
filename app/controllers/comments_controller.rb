class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @picture = Picture.find(params[:picture_id])
    @comments = @picture.comments.create(comment_params)
    @comments.save
    redirect_to :back
  end

  def index
    @comments = Comment.all
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.destroy
    redirect_to pictures_path(@picture)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:picture_id, :text)
    end
end
