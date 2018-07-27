class Question < ApplicationRecord
    validates_presence_of :text
    validates_presence_of :answer_id, on: :update
    belongs_to :quiz
    has_many :answers, dependent: :destroy
end
