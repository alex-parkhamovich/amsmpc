class DoctorAdmin::RegistrationsController < Devise::RegistrationsController

  layout 'doctor_auth'

  def create
    render :new
  end
end
