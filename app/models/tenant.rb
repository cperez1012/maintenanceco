class Tenant < ApplicationRecord
    belongs_to :user
    has_many :tasks through :tenants
end