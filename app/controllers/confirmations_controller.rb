class ConfirmationsController <  Devise::RegistrationsController

  def show
    user = User.confirm_by_token(params[:confirmation_token])
    p"***" *1000
    

    sign_in(user)
    # sign_in(resource)
    # super
  end

  protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      root_path
    else
      new_session_path(resource_name)
    end
  end

end