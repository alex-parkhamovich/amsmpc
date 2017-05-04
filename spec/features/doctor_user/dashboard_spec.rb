require 'rails_helper'

feature 'doctor dashboard' do
  let!(:doctor_user) { create(:doctor_user, :active, :with_doctor_personal) }

  before :each do
    sign_in(doctor_user)
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
