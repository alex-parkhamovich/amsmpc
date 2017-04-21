class DoctorAdmin::AfterSignupController < DoctorAdmin::ApplicationController
  include Wicked::Wizard 
 
  steps :personal

  layout 'doctor_auth'

  def show
    @personal = current_user.doctor_personal
    render_wizard
  end

  def update 
    @personal = current_user.doctor_personal
    status = 'completed'
    if @personal.update_attributes(doctor_personal_params)
      current_user.new_registration_status(status)
    end
    render_wizard @personal
  end

  private

  def doctor_personal_params
    params.require(:doctor_personal).permit(:address, :city, :phone, :clinic, :speciality, :license_id_photo, :face_photo)
  end

  def finish_wizard_path
    after_sign_in_path_for(current_user)
  end
end
