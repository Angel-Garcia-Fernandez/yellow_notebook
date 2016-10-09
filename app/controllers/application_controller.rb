class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :email])
  end

  def add_model_error_to_flash model_resource
    flash[:error] = model_resource.errors.full_messages.join(', ')
  end

  def redirect_to_back_or_default(default = root_url, options = {})
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back, options
    else
      redirect_to default, options
    end
  end

end
