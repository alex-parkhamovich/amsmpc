class DoctorUser < ApplicationRecord
  include UserModels

  REGISTRATION_STATUSES = %w(completed).freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :doctor_personal, dependent: :destroy

  accepts_nested_attributes_for :doctor_personal,  update_only: true

  validates :first_name, :last_name, :birthdate, presence: true
  validates :password, length: { minimum: 6 }, confirmation: true, allow_blank: true
  validates :birthdate,
    date: {
      before_or_equal_to: Proc.new { Time.zone.now - 25.year },
      message: I18n.t('validation.errors.doctor_age_should_be_over_25')
    }, allow_blank: true
  validates :birthdate,
    date: {
      after_or_equal_to: Proc.new { Time.zone.now - 100.years },
      message: I18n.t('validation.errors.invalid_date_format')
    }
  
  def doctor_personal
    super || build_doctor_personal
  end
end
