require 'rails_helper'

feature 'patient dashboard' do
  let!(:patient_user) { create(:patient_user, :active, :with_patient_personal) }

  before :each do
    visit new_patient_admin_patient_user_session_path
    fill_in 'Email', with: patient_user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
  end

  scenario 'successfully login' do
    expect(page.current_path).to eq patient_admin_root_path
    expect(page).to have_content('patient user')
  end

  scenario 'edit profile path' do 
    click_link 'My Profile'

    expect(page).to have_content('My Profile')

    fill_in 'patient_user_last_name', with: 'test'
    click_button 'Update Patient user'

    expect(page).to have_content('Successfully Updated!')
  end
end