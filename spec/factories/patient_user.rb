FactoryGirl.define do
  factory :patient_user do
    sequence(:email) {|n| "patient_#{n}@example.com" }
    birthdate { Time.zone.now - 30.years }
    first_name 'Test'
    sequence(:last_name) {|n| "Patient#{n}" }
    registration_status 'basic'
    password 'password'
    password_confirmation 'password'

    trait :with_patient_personal do
      after(:create) do |patient_user|
        create(:patient_personal, patient_user: patient_user)
      end
    end

    trait :active do
      registration_status 'completed'
    end
  end
end
