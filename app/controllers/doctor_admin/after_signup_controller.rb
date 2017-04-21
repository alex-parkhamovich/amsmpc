class DoctorAdmin::AfterSignupController < DoctorAdmin::ApplicationController
  include Wicked::Wizard 
 
  steps :personal

  layout 'doctor_admin'

  def show
    @personal = current_user.doctor_personal
    render_wizard
  end

  def update 
    @personal = current_user.doctor_personal
    binding.pry
    if @personal.update_attributes(doctor_personal_params)
      current_user.new_registration_status(:completed)
    else
      errors = @personal.errors
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
