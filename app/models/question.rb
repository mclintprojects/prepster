class Question < ApplicationRecord
    validates_presence_of :text
    validates_presence_of :answer_id
    has_many :answer
end
