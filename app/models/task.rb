class Task < ApplicationRecord

    belongs_to :list

    validates_presence_of :name

    scope :pending_status, -> { where(status: false) }

end
