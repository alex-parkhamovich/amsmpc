class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
      when DoctorUser then doctor_admin_root_path
      when PartnerUser then partner_admin_root_path
      when PatientUser then patient_admin_root_path
      when SuperUser then super_admin_root_path
      else root_path
    end
  end
end
