class DoctorAdmin::SignupsController < DoctorAdmin::ApplicationController
  skip_before_action :authenticate_doctor_admin_doctor_user!, only: :basic

  before_action :set_user

  layout 'doctor_auth'
  
  def basic
    if @user.update(doctor_user_params)
      status = :ok
      sign_in_and_redirect @user
    else
      status = :unprocessable_entity
      redirect_to new_doctor_admin_doctor_user_registration_path
    end

    
  end

  def personal
    @personal = @user.doctor_personal 

    render json: @personal
  end

  private 

  def set_user
    @user = current_user || DoctorUser.new()
  end

  def doctor_user_params
    params.require(:doctor_user).permit(:first_name, :last_name, :birthdate, :email, :password, :password_confirmation)
  end

  def doctor_user_personal_params
    params.require(:doctor_personal).permit(:address, :phone)
  end
end
