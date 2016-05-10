class Usuario < ActiveRecord::Base
  has_many :articulo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2,
                                             :facebook]

  def self.from_omniauth(access_token)
    data = access_token.info
    usuario = Usuario.find_by(email: data['email'])

    # Uncomment the section below if you want users to be created if they don't exist
    unless usuario
      usuario = Usuario.create(email: data['email'],
                               password: Devise.friendly_token[0, 20]
                              )
    end
    usuario
  end
end
