module ApplicationHelper
  def list_saving_errors(resource)
    resource.errors.full_messages.join('. ')
  end
end
