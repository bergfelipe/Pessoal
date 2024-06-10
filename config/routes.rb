Rails.application.routes.draw do
  devise_for :admins, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'secreto'
  }

  devise_scope :admin do
    get 'logout_custom', to: 'devise/sessions#destroy', as: :destroy_admin_session_custom
    # Aqui você pode adicionar outras rotas customizadas se necessário
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
