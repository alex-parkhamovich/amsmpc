class DoctorAdmin::ProfilesController < DoctorAdmin::ApplicationController
  before_action :set_user
  include ProfilesControllerConcern

  private

  def set_user
    @resource = current_user || DoctorUser.new
  end

  def update_params
    params.require(:doctor_user)
      .permit(:first_name, :last_name, :birthdate, :email,
        doctor_personal_attributes: [:id, :address, :city, :clinic, :speciality, :phone, :license_id_photo, :face_photo])
  end
end
