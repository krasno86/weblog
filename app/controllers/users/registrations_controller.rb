class Users::RegistrationsController < Devise::RegistrationsController

  prepend_before_action :check_captcha, only: [:create]

  def new
    render layout: false
    p 'ergrwegeasgaeg'
    p'werfwfwfwfwfdwfgweghwejherwjhwrj'
    @user = User.new(params[:user].permit(:id))
    if verify_recaptcha(model: @user, message: 'Error in passing CAPTCHA.') && @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  # def new
  #   if params[:user_info].present?
  #     build_resource({name: params.dig(:user_info, :name), email: params.dig(:user_info, :email), confirmed_at: params.dig(:user_info, :email) ? Time.now : nil })
  #     resource.oauths.build uid: params.dig(:user_info, :uid), provider: params.dig(:user_info, :provider), link: params.dig(:user_info, :link)
  #   else
  #     build_resource({})
  #   end
  #   yield resource if block_given?
  #   respond_with resource
  # end
end