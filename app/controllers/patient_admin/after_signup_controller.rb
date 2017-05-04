class PatientAdmin::AfterSignupController < PatientAdmin::ApplicationController
  include AfterSignupControllerConcern

  private

  def patient_personal_params
    params.require(:patient_personal).permit(:address, :city, :phone, :gender, :id_photo, :face_photo)
  end
end
