class PatientAdmin::DashboardController < PatientAdmin::ApplicationController

  def index
  end

  def terms
    render 'shared/dashboard/terms'
  end

  def help
    render 'shared/dashboard/help'
  end

  def contact_us
    render 'shared/dashboard/contact_us'
  end
end
