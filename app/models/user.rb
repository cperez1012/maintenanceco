class User < ApplicationRecord
    
    has_secure_password
    has_many :tasks
    validates :username, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    devise :omniauthable, :omniauth_providers => [:google_oauth2]

    def self.from_omniauth(auth)
        # Either create a User record or update it based on the provider (Google) and the UID   
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          # binding.pry
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.username = auth.info.name
          # user.token = auth.credentials.token
          # user.expires = auth.credentials.expires
          # user.expires_at = auth.credentials.expires_at
          # user.refresh_token = auth.credentials.refresh_token
        end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
    
end