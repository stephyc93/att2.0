class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

    if resource.parent?
      parents_index_path
    elsif resource.student?
      students_index_path
    else
      teachers_index_path
    end

  end

  protected

  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :fullname, :parent, :student, :teacher) }
    devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name, :phone]
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
    u.permit(:first_name, :last_name, :phone, :password, :password_confirmation,
             :invitation_token)
    end
  end
end
