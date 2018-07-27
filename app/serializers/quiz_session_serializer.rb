class QuizSessionSerializer < ActiveModel::Serializer
    attributes :player, :score, :quiz_id

    def quiz_id
        object.quiz.id
    end
end