module AfterSignupControllerConcern
  extend ActiveSupport::Concern
  include Wicked::Wizard 
  include UserPaths

  def show
    @personal = current_user.doctor_personal
    render_wizard
  end

  def update 
    @personal = current_user.doctor_personal
    status = 'completed'
    if @personal.update_attributes(doctor_personal_params)
      current_user.new_registration_status(status)
      flash[:notice] = t('flash.success') 
    else
      flash.now[:alert] = @personal.errors.full_messages.join('. ')
    end
    render_wizard @personal
  end

  private

  def finish_wizard_path
    after_sign_in_path_for(current_user)
  end
end