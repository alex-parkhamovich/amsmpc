Rails.application.routes.draw do

  root 'home#index'

  namespace :super_admin do
    devise_for :super_users, path: ''
  end
  
  namespace :patient_admin do
    devise_for :patient_users, path: ''
  end

  namespace :doctor_admin do
    devise_for :doctor_users, path: ''
  end
end
