class Quiz < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :duration
    validates_presence_of :is_public
    validates_presence_of :sessions
    validates_presence_of :is_completed
    validates_presence_of :identifier
    belongs_to :user
    has_many :questions
    has_many :quiz_sessions
end
