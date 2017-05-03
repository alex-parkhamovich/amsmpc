class PatientAdmin::ProfilesController < PatientAdmin::ApplicationController
  before_action :set_user
  include ProfilesControllerConcern

  private

  def set_user
    @resource = current_user || PatientUser.new
  end

  def update_params
    params.require(:patient_user)
      .permit(:first_name, :last_name, :birthdate, :email,
        patient_personal_attributes: [:id, :address, :city, :gender, :phone, :id_photo, :face_photo])
  end
end
