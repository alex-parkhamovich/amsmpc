class DoctorAdmin::ApplicationController < ApplicationController
  before_action :authenticate_doctor_admin_doctor_user!

  layout 'dashboard'

  helper_method :current_user, :namespace

  def namespace
    :doctor_admin
  end

  def current_user
    current_doctor_admin_doctor_user
  end
end
