module Features
  module SessionHelpers
    def sign_in(user)
      visit sign_in_path_for(user)
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'
    end

    def sign_in_path_for(user)
      user.is_a?(DoctorUser) ? new_doctor_admin_doctor_user_session_path : new_patient_admin_patient_user_session_path
    end
  end
end
