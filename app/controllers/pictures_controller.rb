class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    #render layout: false
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
    authorize! :read, @picture
  end

end
