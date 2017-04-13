Rails.application.routes.draw do

  root 'home#index'

  namespace :super_admin do
    root 'dashboard#index'

    devise_for :super_users, path: ''
  end
  
  namespace :patient_admin do
    root 'dashboard#index'

    devise_for :patient_users, path: ''

  end

  namespace :doctor_admin do
    root 'dashboard#index'

    devise_for :doctor_users, path: ''
    
    resource :signup do
      post :basic
    end
  end
end
