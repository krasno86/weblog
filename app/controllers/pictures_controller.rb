class PicturesController < ApplicationController
  before_action :set_picture, only: [:!, :edit, :update, :destroy]

  def index
    @pictures = Picture.all.page(params[:page]).per(5)
  end

  def bla
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
    # respond_to do |format|
    #   if @picture.save
    #     format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
    #     format.json { render :show, status: :created, location: @picture }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @picture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  # def update
  #   respond_to do |format|
  #     if @picture.update(picture_params)
  #       format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @picture }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @picture.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    params.fetch(:picture, {})
  end
end
