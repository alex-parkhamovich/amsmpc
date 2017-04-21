Rails.application.routes.draw do

  root 'home#index'

  namespace :super_admin do
    root 'dashboard#index'

    devise_for :super_users, path: ''
  end
  
  namespace :patient_admin do
    root 'dashboard#index'
    
    get '/contact_us', to: 'dashboard#contact_us', as: :contact_us
    get '/help', to: 'dashboard#help', as: :help
    get '/terms', to: 'dashboard#terms', as: :terms

    devise_for :patient_users, path: ''

    resource :signup do 
      post :basic
    end

    resource :profile, only: [:show]
  end

  namespace :doctor_admin do
    root 'dashboard#index'

    get '/contact_us', to: 'dashboard#contact_us', as: :contact_us
    get '/help', to: 'dashboard#help', as: :help
    get '/terms', to: 'dashboard#terms', as: :terms

    devise_for :doctor_users, path: ''
    
    resource :signup do
      post :basic
    end

    resource :profile, only: [:show]
  end
end
