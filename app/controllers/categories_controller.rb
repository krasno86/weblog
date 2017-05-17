class CategoriesController < ApplicationController

  before_action :set_category, only:[:!]

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def show
     @category = Category.find_by_name(params[:id])
  end

  def index
    @categories = Category.all
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
end
