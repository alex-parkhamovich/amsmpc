class DoctorAdmin::ApplicationController < ApplicationController
  before_action :authenticate_doctor_admin_doctor_user!

  layout 'doctor_admin'

  def namespace
    :doctor_admin
  end

  def current_user
    current_doctor_admin_doctor_user
  end
end
