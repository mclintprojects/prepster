class QuizSerializer < ActiveModel::Serializer
    attributes :title, :duration, :is_public, :sessions,
                :is_completed, :identifier
end