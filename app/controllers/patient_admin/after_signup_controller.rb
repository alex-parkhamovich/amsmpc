class PatientAdmin::AfterSignupController < PatientAdmin::ApplicationController
  include Wicked::Wizard 
 
  steps :personal

  layout 'patient_auth'

  def show
    @personal = current_user.patient_personal
    render_wizard
  end

  def update 
    @personal = current_user.patient_personal
    status = 'completed'
    if @personal.update_attributes(patient_personal_params)
      current_user.new_registration_status(status)
    end
    render_wizard @personal
  end

  private

  def patient_personal_params
    params.require(:patient_personal).permit(:address, :city, :phone, :gender, :id_photo, :face_photo)
  end

  def finish_wizard_path
    after_sign_in_path_for(current_user)
  end
end
