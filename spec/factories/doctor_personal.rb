FactoryGirl.define do
  factory(:doctor_personal) do
    address 'Patient st. 77'
    city 'San Francisco'
    speciality 'dentist'
    clinic 'number 5'
    phone '(222) 456-7890'
    license_id_photo 'asd'
    face_photo 'asd'
    doctor_user
  end
end
