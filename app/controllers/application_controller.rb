class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  before_filter :set_user

  before_filter :set_mailer_host

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def after_sign_in_path_for(resource)

    if resource.parent?
      parents_path
      current_parent = Parent.where(["user_id = ?", resource.id]).first
    elsif resource.student?
      students_path
      current_student = Student.where(["user_id = ?", resource.id]).first
    elsif resource.teacher?
      teachers_path
      current_teacher = Teacher.where(["user_id = ?", resource.id]).first
    else
      user = User.find resource.id
      user.update_attributes(:teacher => '1')
      current_student = Student.where(["user_id = ?", resource.id]).first
      students_path
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

  def set_user
    if current_user.parent?
      @current_parent = Parent.where(["user_id = ?", current_user.id]).first
    elsif current_user.student?
      @current_student = Student.where(["user_id = ?", current_user.id]).first
    else
      @current_teacher = Teacher.where(["user_id = ?", current_user.id]).first
    end unless !current_user
  end

end
