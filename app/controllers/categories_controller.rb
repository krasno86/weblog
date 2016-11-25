class CategoriesController < ApplicationController

  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def index
    render layout: false
  end

  def show
    #tits_path
    #render layout: false
  end

end
