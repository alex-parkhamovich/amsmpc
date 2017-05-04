module PersonalsHelper
  def personals(user)
    doctor?(user) ? :doctor_personal : :patient_personal
  end

  private 

  def doctor?(user)
    user.is_a? DoctorUser
  end
end