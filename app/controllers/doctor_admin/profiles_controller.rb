class DoctorAdmin::ProfilesController < DoctorAdmin::ApplicationController
  before_action :set_user

  def show
  end

  def update 
    if @user.update_attributes(update_params)
      sign_in @user, :bypass => true
      redirect_to doctor_admin_profile_path
    else
      render :show
    end
  end

  private

  def set_user
    @user = current_user || DoctorUser.new
  end

  def update_params
    params.require(:doctor_user)
      .permit(:first_name, :last_name, :birthdate, :email,
        doctor_personal_attributes: [:id, :address, :city, :clinic, :speciality, :phone, :license_id_photo, :face_photo])
  end
end