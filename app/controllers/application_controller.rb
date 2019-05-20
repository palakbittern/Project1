class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
