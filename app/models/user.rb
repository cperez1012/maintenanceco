class User < ApplicationRecord
    
    has_secure_password
    has_many :lists
    has_many :comments
    has_many :commented_lists, through: :comments, source: :list
    
    has_many :tasks, through: :lists

    validates :username, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    def self.find_or_create_from_omniauth_hash(auth)
      # Creates a new user only if it doesn't exist
      email = auth[:info][:email]
      # binding.pry
      find_or_create_by(email: email) do |user|
          user.provider = auth.provider
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex(10)
      end
    end

    def self.all_except(user)
      where.not(id: user)
    end
 
end