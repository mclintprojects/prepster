class Question < ApplicationRecord
    validates_presence_of :text
    validates_presence_of :answer_id, on: :update
    has_many :answers
end
