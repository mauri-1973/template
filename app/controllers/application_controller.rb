class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :profile_picture])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :profile_picture])
	end
  def after_sign_in_path_for(resource)
    # Coloca aquí la ruta hacia donde quieres redireccionar al usuario después del registro.
    # `resource` es el usuario que ha sido registrado.
    # suponiendo que tienes una ruta `user_dashboard_path` definida.
    if current_user.role == 'admin'
      job_posts_path
    elsif current_user.role == 'user'
      ver_postulaciones_disponibles_path
    else
      root_path
    end
  end
private
    def after_sign_out_path_for(resource_or_scope)
      root_path  # Asigna aquí la ruta deseada, como el index.
    end
end
