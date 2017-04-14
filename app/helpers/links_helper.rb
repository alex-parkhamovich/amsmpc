module LinksHelper
  def root_path_for(user)
    doctor?(user) ? doctor_admin_root_path : patient_admin_root_path
  end

  def documents_path_for(user, options = {})
    doctor?(user) ? doctor_admin_signed_documents_path(options) : patient_admin_signed_documents_path(options)
  end

  def profile_path_for(user)
    doctor?(user) ? doctor_admin_profile_path : patient_admin_profile_path
  end

  def visit_path_for(user)
    doctor?(user) ? doctor_admin_visit_path : patient_admin_visit_path
  end

  def help_path_for(user)
    doctor?(user) ? doctor_admin_help_path : patient_admin_help_path
  end

  def contact_us_path_for(user)
    doctor?(user) ? doctor_admin_contact_us_path : patient_admin_contact_us_path
  end

  def terms_path_for(user)
    doctor?(user) ? doctor_admin_terms_path : patient_admin_terms_path
  end

  private

  def doctor?(user)
    user.is_a? DoctorUser
  end
end
