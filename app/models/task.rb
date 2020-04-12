class Task < ApplicationRecord

    belongs_to :user
    belongs_to :list
    
    validates :user_id, :presence => true

end
