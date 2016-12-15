class CommentsController < ApplicationController

  # before_action :set_comment, only: [:show, :create]
  prepend_before_action :check_captcha, only: [:create]

  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_back fallback_location: :back
  end

  def index
     @users = User.all
    # @comments = Comment.all
    @comments = Comment.includes(:user, picture: :category).order('created_at ASC').page(params[:page]).per 10
  end

  # def destroy
  #   @picture = Picture.find(params[:picture_id])
  #   @comment = @picture.comments.create(comment_params)
  #   @comment.destroy
  #   redirect_to pictures_path(@picture)
  # end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:picture_id, :text)
    end

    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end
    end

end
