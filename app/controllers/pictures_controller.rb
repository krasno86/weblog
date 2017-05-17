class PicturesController < ApplicationController

  before_action :set_locale, :set_picture, only: [:!, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :wellcome]

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def index
    @pictures = Picture.all.page(params[:page]).per(5)
  end

  def wellcome
  end

  def like
    @picture = Picture.find(params[:id])
    @picture.liked_by current_user
    redirect_to :back
  end

  def dislike_picture
    @picture = Picture.find(params[:id])
    @picture.disliked_by current_user
    redirect_to :back
  end

  def show
    #@likes=Like.all
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to @picture
    else
      render 'new'
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_picture
    @picture = Picture.friendly.find(params[:id])
  end

  def picture_params
    params.fetch(:picture, {})
  end
end
