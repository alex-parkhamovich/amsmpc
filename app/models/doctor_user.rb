class DoctorUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :doctor_personal, dependent: :destroy

  accepts_nested_attributes_for :doctor_personal,  update_only: true

  def doctor_personal
    super || build_doctor_personal
  end
end
