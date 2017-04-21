module ApplicationHelper
  def resource 
    @resource ||= DoctorUser.new
  end
end
