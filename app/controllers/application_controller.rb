class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception


  def authenticate_admin!
    redirect_to main_app.root_path unless current_user.admin? == true
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :pesel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :pesel])
  end

end