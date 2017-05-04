FactoryGirl.define do
  factory(:doctor_user) do
    sequence(:email) {|n| "doctor_#{n}@example.com" }
    first_name 'Test'
    sequence(:last_name) {|n| "Doctor#{n}" }
    birthdate { Time.zone.now - 30.years }
    password 'password'
    password_confirmation 'password'
    registration_status 'basic'

    trait :with_doctor_personal do
      after(:create) do |doctor_user|
        create(:doctor_personal, doctor_user: doctor_user)
      end
    end

    trait :active do
      registration_status 'completed'
    end
  end
end
