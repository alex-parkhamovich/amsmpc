class PatientAdmin::ApplicationController < ApplicationController
  before_action :authenticate_patient_admin_patient_user!

  def namespace
    :patient_admin
  end

  def current_user
    current_patient_admin_patient_user
  end
end
