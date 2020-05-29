class Task < ApplicationRecord

    belongs_to :list

    validates_presence_of :name

    # scope :longest_summary, -> { limit(1).order("MAX(CHAR_LENGTH(summary)) desc").pluck(:summary) }
    scope :longest_summary, -> (list) { where(list_id: list.id).order('length(summary) DESC').limit(1) }

    scope :shortest_summary, -> { order('length(summary) ASC').limit(1) }

end
