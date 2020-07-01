class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def after_sign_out_path_for(resource)
      root_path #idがないので必要ない
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
