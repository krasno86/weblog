class CategoriesController < ApplicationController

  #before_filter :authenticate_user!
  before_action :set_category, only:[:!]

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def show
     @category = Category.find_by_name(params[:id])
  end

  def index
    #render layout: false
    @categories = Category.all
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
end
