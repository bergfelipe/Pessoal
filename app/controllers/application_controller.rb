class ApplicationController < ActionController::Base
    before_action :authenticate_admin!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :cpf, :tipo, :perfil])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome,:cpf, :tipo, :perfil])
  end
end
