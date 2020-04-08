class User < ApplicationRecord
    
    has_secure_password
    has_many :tasks
    validates :username, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.name = auth.info.username
        user.email = auth.info.email
        user.password = auth.info.password
      end
    end
    
end