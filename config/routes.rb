Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_scope :usuario do
    delete "usuarios/sign_out" => "usuarios/sessions#destroy"
  end

  devise_for :usuarios, controllers: { passwords: "usuarios/passwords",
                                        sessions: "usuarios/sessions",
                                        registrations: "usuarios/registrations",
                                        omniauth_callbacks: "usuarios/omniauth_callbacks" }

  resources :articulos
  get :set_new_locale, to:'application#set_new_locale'
  get :enviar_sumario, to:'application#enviar_sumario'
  get :enviar_sumario_nuevos_usuarios, to: 'application#enviar_sumario_nuevos_usuarios'
  root to: 'welcome#index'

end
