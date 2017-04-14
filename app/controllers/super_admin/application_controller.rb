class SuperAdmin::ApplicationController < ApplicationController
  before_action :authenticate_super_admin_super_user!

  def namespace
    :super_admin
  end
end
