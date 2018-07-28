class QuizSessionSerializer < ActiveModel::Serializer
    attributes :id, :player, :score, :quiz_id

    def quiz_id
        object.quiz.id
    end
end

class MarkedQuizSessionSerializer < ActiveModel::Serializer
    attributes :player, :score, :leaderboard

    def score
        "#{object.score}/#{object.quiz.questions.count}"
    end

    def leaderboard
        object.quiz.quiz_sessions.order("score DESC").limit(5)
    end
end