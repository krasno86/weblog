class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  # GET /comments.json
  # POST /comments
  # POST /comments.json
  def create
    @picture = Picture.find(params[:picture_id])
    @comments = @picture.comments.create(comment_params)
    #@comment = @category.picture.comments.create(comment_params)
    #redirect_to pictures_path(@picture)
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end

    # @comment = current_user.comment.build(micropost_params)
    # if @comment.save
    #   #flash[:success] = 'Comment created!'
    #   redirect_to root_url
  end

  def index
    #render layout: false
    #@picture = Picture.find(params[:picture_id])
    #@comments = @picture.comments.find(params[:id])
    @comments = Comment.all

  end

#category_picture_comments
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.destroy
    redirect_to pictures_path(@picture)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {})
    end
end
