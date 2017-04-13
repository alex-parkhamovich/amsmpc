class PatientAdmin::ApplicationController < ApplicationController
  before_action :authenticate_patient_admin_patient_user!
  before_action :check_user_registration!

  def namespace
    :patient_admin
  end
end
