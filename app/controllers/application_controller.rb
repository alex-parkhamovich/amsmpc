class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
      when DoctorUser then resource.sign_up_completed? ? doctor_admin_root_path : doctor_admin_after_signup_path(:personal)
      when PatientUser then resource.sign_up_completed? ? patient_admin_root_path : patient_admin_after_signup_path(:personal)
      when SuperUser then super_admin_root_path
      else root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :birthdate, :password, :password_confirmation)
    end
  end
end
