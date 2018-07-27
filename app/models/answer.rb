class Answer < ApplicationRecord
    validates_presence_of :text
    belongs_to :question
end
