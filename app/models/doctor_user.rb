class DoctorUser < ApplicationRecord
  has_many :doctor_personals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
