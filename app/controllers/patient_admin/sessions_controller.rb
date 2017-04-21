class PatientAdmin::SessionsController < Devise::SessionsController  
  layout 'patient_auth'

  def new
    super{ |resource| return render 'shared/sessions/new' }
  end
end
