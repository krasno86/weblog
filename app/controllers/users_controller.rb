class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Successful'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Eror!!!'
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :name, :avatar)
    end
end
