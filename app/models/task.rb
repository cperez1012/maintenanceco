class Task < ApplicationRecord

    belongs_to :user
    has_and_belongs_to_many :list
    # belongs_to :list
    
    # validates :user_id, :presence => true

end
