module UserModels
  extend ActiveSupport::Concern

  def has_status?(*args)
    args.include? status.to_sym
  end

  def has_registration_status?(*args)
    args.include? registration_status.to_sym
  end

  def new_registration_status(new_reg_status)
    update_column(:registration_status, new_reg_status)
  end

  def sign_up_completed?
    has_registration_status? :completed
  end
end
