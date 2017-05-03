FactoryGirl.define do
  factory(:patient_personal) do
    address 'Patient st. 77'
    city 'San Francisco'
    gender 'male'
    phone '(222) 456-7890'
    id_photo 'asd'
    face_photo 'asd'
    patient_user
  end
end
