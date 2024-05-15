Rails.application.routes.draw do
   devise_for :admins
   devise_scope :admin do
    get '/admins/sign_out_custom', to: 'devise/sessions#destroy', as: :destroy_admin_session_custom
  end
  resources :pacientes
  resources :consulta
  resources :medicos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  get 'home', to: 'home#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
