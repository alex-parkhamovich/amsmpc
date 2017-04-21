class SuperAdmin::SessionsController < Devise::SessionsController  
  def new
    super{ |resource| return render 'shared/sessions/new' }
  end
end
