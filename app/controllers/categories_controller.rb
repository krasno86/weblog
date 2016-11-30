class CategoriesController < ApplicationController

  #before_filter :authenticate_user!
  before_action :set_category, only:[:show]

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def show
    #render layout: false
    @categories = Picture.find(params[:id])

  end

  def index
    #render layout: false
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  private
  def set_category
    @categories = Category.find(params[:id])
  end
end
