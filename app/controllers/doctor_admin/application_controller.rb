class DoctorAdmin::ApplicationController < ApplicationController
  before_action :authenticate_doctor_admin_doctor_user!
  before_action :check_user_registration!

  def namespace
    :doctor_admin
  end
end
