require 'rails_helper'

feature 'patient dashboard' do
  let!(:patient_user) { create(:patient_user, :active, :with_patient_personal) }

  before :each do
    sign_in(patient_user)
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

  scenario 'log out redirect' do
    click_link 'Log out'

    expect(page).to have_content('Signed out successfully.')
  end
end
