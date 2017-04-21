Rails.application.routes.draw do

  root 'home#index'

  namespace :super_admin do
    root 'dashboard#index'

    devise_for :super_users, path: ''
  end

  namespace :doctor_admin do
    root 'dashboard#index'

    get '/contact_us', to: 'dashboard#contact_us', as: :contact_us
    get '/help', to: 'dashboard#help', as: :help
    get '/terms', to: 'dashboard#terms', as: :terms

    devise_for :doctor_users, path: ''
    
    resources :after_signup

    resource :profile, only: [:show, :update]
  end
  
  namespace :patient_admin do
    root 'dashboard#index'
    
    get '/contact_us', to: 'dashboard#contact_us', as: :contact_us
    get '/help', to: 'dashboard#help', as: :help
    get '/terms', to: 'dashboard#terms', as: :terms

    devise_for :patient_users, path: ''

    resources :after_signup

    resource :profile, only: [:show, :update]
  end
end
