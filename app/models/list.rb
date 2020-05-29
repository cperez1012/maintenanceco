class List < ApplicationRecord

    belongs_to :user
    has_many :comments
    has_many :commentators, through: :comments, source: 'user'
    has_many :tasks, dependent: :destroy

    validates_presence_of :name, uniqueness: true

    accepts_nested_attributes_for :tasks

    scope :ordered_by_name, -> { reorder(name: "ASC")}
end