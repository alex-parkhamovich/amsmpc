class PatientAdmin::ApplicationController < ApplicationController
  before_action :authenticate_patient_admin_patient_user!

  def namespace
    :patient_admin
  end
end
