class PatientAdmin::ApplicationController < ApplicationController
  before_action :authenticate_patient_admin_patient_user!

  layout 'patient_admin'

  def namespace
    :patient_admin
  end

  def current_user
    current_patient_admin_patient_user
  end
end
