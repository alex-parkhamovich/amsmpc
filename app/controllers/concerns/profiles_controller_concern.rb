module ProfilesControllerConcern 
  extend ActiveSupport::Concern
  include UserPaths

  def show
  end

  def update 
    if @resource.update_attributes(update_params)
      flash[:notice] = t('flash.success') 
      redirect_to profile_path_for(@resource)
    else
      flash.now[:alert] = @resource.errors.full_messages.join('. ')
      render :show
    end
  end
end