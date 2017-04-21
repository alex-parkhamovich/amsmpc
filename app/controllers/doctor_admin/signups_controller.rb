class DoctorAdmin::SignupsController < DoctorAdmin::ApplicationController
  skip_before_action :authenticate_doctor_admin_doctor_user!, only: :basic

  before_action :set_user

  layout 'doctor_auth'
  
  def basic
    @user.update(doctor_user_params)
  end

  private 

  def set_user
    @user = current_user || DoctorUser.new()
  end

  def doctor_user_params
    params.require(:doctor_user).permit(:first_name, :last_name, :birthdate, :email, :password, :password_confirmation)
  end
end
