class QuizSession < ApplicationRecord
    validates_presence_of :player
    validates_presence_of :score
    belongs_to :quiz
end
