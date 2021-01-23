class User < ApplicationRecord
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    binding.pry
    user = where(email: auth.info.email).first

    if user.present?
      user.update_attributes(display_name: auth.info.name, image: auth.info.image)
    else
      user = User.create(email: auth.info.email, provider: auth.provider, uid: auth.uid, display_name: auth.info.name, image: auth.info.image)
    end
    user
  end
end
