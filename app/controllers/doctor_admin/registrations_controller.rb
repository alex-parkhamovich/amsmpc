class DoctorAdmin::RegistrationsController < Devise::RegistrationsController
  layout 'auth'

  private

  def after_sign_up_path_for(resource)
    doctor_admin_after_signup_path(:personal)
  end
end
