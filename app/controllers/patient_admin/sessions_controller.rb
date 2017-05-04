class PatientAdmin::SessionsController < Devise::SessionsController  
  layout 'auth'

  def new
    super{ |resource| return render 'shared/sessions/new' }
  end
end
