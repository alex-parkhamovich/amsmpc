class SuperAdmin::ApplicationController < ApplicationController
  before_action :authenticate_super_admin_super_user!

  helper_method :current_user, :namespace

  def namespace
    :super_admin
  end
end
