 Rails.application.routes.draw do

  devise_scope :usuario do
    delete "usuarios/sign_out" => "usuarios/sessions#destroy"
  end

  devise_for :usuarios, controllers: { passwords: "usuarios/passwords",
                                        sessions: "usuarios/sessions",
                                        registrations: "usuarios/registrations",
                                        omniauth_callbacks: "usuarios/omniauth_callbacks"}
  resources :articulos
  get :set_new_locale, to:'application#set_new_locale'
  root to: 'welcome#index'

end
