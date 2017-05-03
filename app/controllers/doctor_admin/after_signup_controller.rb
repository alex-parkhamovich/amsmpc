class DoctorAdmin::AfterSignupController < DoctorAdmin::ApplicationController
  include AfterSignupControllerConcern

  steps :personal

  layout 'auth'

  private

  def doctor_personal_params
    params.require(:doctor_personal).permit(:address, :city, :phone, :clinic, :speciality, :license_id_photo, :face_photo)
  end
end
