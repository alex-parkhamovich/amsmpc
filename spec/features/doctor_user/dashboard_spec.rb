require 'rails_helper'

feature 'doctor dashboard' do
  let!(:doctor_user) { create(:doctor_user, :active, :with_doctor_personal) }

  before :each do
    visit new_doctor_admin_doctor_user_session_path
    fill_in 'Email', with: doctor_user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
  end

  scenario 'successfully login' do
    expect(page.current_path).to eq doctor_admin_root_path
    expect(page).to have_content('doctor user')
  end

  scenario 'edit profile path' do 
    click_link 'My Profile'

    expect(page).to have_content('My Profile')

    fill_in 'doctor_user_last_name', with: 'test'
    click_button 'Update Doctor user'

    expect(page).to have_content('Successfully Updated!')
  end
end
