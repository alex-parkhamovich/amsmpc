class PatientUser < ApplicationRecord
  has_many :patient_personals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :birthdate, presence: true
  validates :password, length: { minimum: 6 }, allow_blank: true
end
