class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    pictures_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    if I18n.locale == I18n.default_locale
      return {locale: nil}
    else
      return {locale: I18n.locale}
    end
  end

end
