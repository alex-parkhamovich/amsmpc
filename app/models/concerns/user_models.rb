module UserModels
  extend ActiveSupport::Concern

  included do
    scope :registration_completed, -> { where registration_status: 'completed' }
    scope :registration_uncompleted, -> { where.not(registration_status: 'completed') }
    scope :with_active_session, -> { where('current_sign_in_at > ? OR updated_at > ?', Time.zone.now - Devise.timeout_in, Time.zone.now - Devise.timeout_in) }
  end

  def has_status?(*args)
    args.include? status.to_sym
  end

  def has_registration_status?(*args)
    args.include? registration_status.to_sym
  end

  def registration_status_index
    self.class::REGISTRATION_STATUSES.index(registration_status) || 0
  end

  def new_registration_status(new_reg_status)
    current_index = self.class::REGISTRATION_STATUSES.index(registration_status)
    new_index = self.class::REGISTRATION_STATUSES.index(new_reg_status)
    return false if current_index.nil? || new_index.nil?
    diff = new_index - current_index
    if diff <= 0
      true
    elsif diff == 1
      update_column(:registration_status, new_reg_status)
      true
    else
      errors[:base] << I18n.t('registration.common.errors.invalid_registration_status')
      false
    end
  end

  def sign_up_completed?
    has_registration_status? :completed
  end
end
