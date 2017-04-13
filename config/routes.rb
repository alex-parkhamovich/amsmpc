Rails.application.routes.draw do
  devise_for :patient_users
  devise_for :doctor_users
  devise_for :super_users
  root 'home#index'
end
