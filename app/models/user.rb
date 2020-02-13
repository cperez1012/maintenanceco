
class User < ApplicationRecord
    
    has_secure_password
    validates :username, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    has_many :tasks

    private

    def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
      end
    end
end