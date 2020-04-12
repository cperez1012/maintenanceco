class User < ApplicationRecord
    
    has_secure_password
    has_many :tasks
    validates :username, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    def self.find_or_create_from_omniauth_hash(auth)
      # Creates a new user only if it doesn't exist
      email = auth[:info][:email]

      find_or_create_by(email: email) do |user|
          user.provider = auth.provider
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex(10)
      end
    end
    
    # def self.from_omniauth(auth)
    #   # Creates a new user only if it doesn't exist
    #   where(email: auth.info.email).first_or_initialize do |user|
    #     user.name = auth.info.username
    #     user.email = auth.info.email
    #     user.password = auth.info.password
    #   end
    # end  
end