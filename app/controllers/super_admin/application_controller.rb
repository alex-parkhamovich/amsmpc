class SuperAdmin::ApplicationController < ApplicationController
  before_action :authenticate_super_admin_super_user!
  before_action :check_user_registration!

  def namespace
    :super_admin
  end
end
