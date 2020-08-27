class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		user_path(current_user)
	end

	def after_sign_out_path_for(resource)
	    root_path
	end

	private
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,
	                                               :like_team,:profile_image])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:like_team,:email])
	end
end
