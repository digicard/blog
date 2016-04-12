Rails.application.routes.draw do

  devise_for :usuarios , only: :omniauth_callbacks, controllers: { passwords: "usuarios/passwords",
                                        sessions: "usuarios/sessions", 
                                        registrations: "usuarios/registrations", 
                                        omniauth_callbacks: "usuarios/omniauth_callbacks"}
  
  devise_scope :usuario do
    delete "usuarios/sign_out" => "usuarios/sessions#destroy"
  end

  scope "/:locale"  do
    devise_for :usuarios, skip: :omniauth_callbacks, controllers: { passwords: "usuarios/passwords",
                                        sessions: "usuarios/sessions", 
                                        registrations: "usuarios/registrations", 
                                        omniauth_callbacks: "usuarios/omniauth_callbacks"}
    resources :articulos
  end

  get '/:locale' => 'welcome#index'
  root to: redirect("/#{I18n.locale}")

end
