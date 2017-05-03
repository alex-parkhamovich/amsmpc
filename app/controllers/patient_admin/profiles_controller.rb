class PatientAdmin::ProfilesController < PatientAdmin::ApplicationController
  before_action :set_user

  def show
  end

  def update 
    if @user.update(update_params)
      flash.now[:alert] = list_saving_errors(@user)
      redirect_to patient_admin_profile_path
    else
      render :show
    end
  end

  private

  def set_user
    @user = current_user || PatientUser.new
  end

  def update_params
    params.require(:patient_user)
      .permit(:first_name, :last_name, :birthdate, :email,
        patient_personal_attributes: [:id, :address, :city, :gender, :phone, :id_photo, :face_photo])
  end
end
