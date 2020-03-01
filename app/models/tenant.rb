class Tenant < ApplicationRecord
    belongs_to :user
    has_many :tasks through :users
    validates :renter, :address, :renter_email, :renter_cell_phone, presence: true
end