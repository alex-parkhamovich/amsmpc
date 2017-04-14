class PatientAdmin::SignupsController < PatientAdmin::ApplicationController
  skip_before_action :authenticate_patient_admin_patient_user!, only: :basic

  before_action :set_user

  layout 'patient_auth'

  def basic
    @user.update(patient_user_params)
  end

  private 

  def set_user
    @user = current_user || PatientUser.new()
  end

  def patient_user_params
    params.require(:patient_user).permit(:first_name, :last_name, :birthdate, :email, :password, :password_confirmation)
  end
end