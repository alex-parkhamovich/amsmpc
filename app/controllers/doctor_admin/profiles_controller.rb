class DoctorAdmin::ProfilesController < DoctorAdmin::ApplicationController
  before_action :set_user

  def show
  end

  def update 
    if @user.update_attributes(update_params)
      flash[:notice] = t('flash.success') 
      redirect_to doctor_admin_profile_path
    else
      flash.now[:alert] = @user.errors.full_messages.join('. ')
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