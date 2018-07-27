class Quiz < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :duration
    validates_presence_of :identifier
    validate :quiz_validations
    belongs_to :user
    has_many :questions
    has_many :quiz_sessions

    def quiz_validations
        if(Quiz.find_by(user_id: user_id, title: title).present?)
            errors.add(:title, "exists in an existing quiz")
        end
    end
end
