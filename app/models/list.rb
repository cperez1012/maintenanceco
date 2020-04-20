class List < ApplicationRecord

    belongs_to :user
    has_many :tasks

    # has_many :user_lists
    # has_many :users, through: :user_lists
    
    validates_presence_of :name, uniqueness: true

    accepts_nested_attributes_for :tasks

    scope :ordered_by_name, -> { reorder(name: "ASC")}
end
