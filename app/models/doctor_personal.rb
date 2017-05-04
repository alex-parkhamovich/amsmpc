class DoctorPersonal < ApplicationRecord
  belongs_to :doctor_user

  validates :doctor_user, :address, :city, :phone, :clinic, :speciality, 
            :license_id_photo, :face_photo, presence: true
end
