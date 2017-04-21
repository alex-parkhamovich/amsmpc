class DoctorAdmin::RegistrationsController < Devise::RegistrationsController

  def create
    render :new
  end
end
