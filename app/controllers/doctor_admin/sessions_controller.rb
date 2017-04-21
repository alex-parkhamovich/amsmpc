class DoctorAdmin::SessionsController < Devise::SessionsController
  layout 'doctor_auth'

  def new
    super{ |resource| return render 'shared/sessions/new' }
  end
end
