# class RegistrationsController <  Devise::RegistrationsController
#
#   prepend_before_action :check_captcha, only: [:create]
#
#   def new
#     render layout: false
#     @user = User.new(params[:user].permit(:id))
#     if verify_recaptcha(model: @user, message: 'Error in passing CAPTCHA.') && @user.save
#       redirect_to @user
#     else
#       render 'new'
#     end
#   end
#
# end