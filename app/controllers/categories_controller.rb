class CategoriesController < ApplicationController

  #before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def show
    render layout: false
    @picture = Picture.find(params[:id])
    authorize! :read, @article
  end

  def tits
    #tits_path
    #render layout: false
    @picture = Picture.find(category[:id])
  end

  def index
    @category = Category.all
  end

  def alcohol
    @picture = Picture.find(params[:id])
  end

  def ruby
    @picture = Picture.find(params[:id])
  end

  def christmas
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def cats
    @picture = Picture.find(params[:id])
  end

end
