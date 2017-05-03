module UserPaths
  extend ActiveSupport::Concern

  private 

  def profile_path_for(user)
    doctor?(user) ? doctor_admin_profile_path : patient_admin_profile_path
  end

  def doctor?(user)
    user.is_a? DoctorUser
  end
end