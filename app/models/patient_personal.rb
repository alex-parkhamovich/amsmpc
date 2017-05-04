class PatientPersonal < ApplicationRecord
  belongs_to :patient_user

  validates :patient_user, :address, :city, :phone, :gender,
            :id_photo, :face_photo, presence: true
end