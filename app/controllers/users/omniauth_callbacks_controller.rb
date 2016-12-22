class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #
  #   if @user.persisted?
  #     sign_in_and_redirect @user , :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  #
  #   def failure
  #     redirect_to root_path
  #   end
  # end

  def facebook
    auth_info = request.env.dig 'omniauth.auth', 'extra', 'raw_info'
    redirect_to root_path, flash: {error: 'Error from Facebook!' } and return unless auth_info
    @user = User.find_user_by_oauth uid: auth_info['id'], provider: 'facebook'
    if @user.present?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'acebook') if is_navigational_format?
    else @user = User.find_by(email: auth_info['email'])
    if @user.present?
      @user.oauths.create uid: auth_info['id'], provider: 'facebook', link: auth_info['link']
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      redirect_to new_user_registration_path
    end
    end
  end

  def vk
    auth_raw_info = request.env.dig 'omniauth.auth', 'extra', 'raw_info'
    redirect_to root_path, flash: {error: 'Error from Vk!' } and return unless auth_info
    @user = User.find_user_by_oauth uid: auth_raw_info['id'], provider: 'vk'
    if @user.present?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Vk') if is_navigational_format?
    elsif current_user.present?
      user = current_user
      user.oauths.create uid: auth_raw_info['id'], provider: 'vk', link: "https://vk.com/id#{auth_info['user_id']}"
      sign_in_and_redirect user
      set_flash_message(:notice, :success, kind: 'Vk') if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

  # def twitter
  #   auth_info = request.env.dig 'omniauth.auth', 'extra', 'raw_info'
  # end

  def twitter
    auth_info = request.env.dig 'omniauth.auth', 'extra', 'raw_info'
    redirect_to root_path, flash: {error: 'Error from twitter!' } and return unless auth_info
    @user = User.find_user_by_oauth uid: auth_raw_info['id'], provider: 'twitter'
    if @user.present?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'twitter') if is_navigational_format?
    elsif current_user.present?
      user = current_user
      user.oauths.create uid: auth_raw_info['id'], provider: 'twitter', link: "https://twitter.com/id#{auth_info['user_id']}"
      sign_in_and_redirect user
      set_flash_message(:notice, :success, kind: 'twitter') if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

end