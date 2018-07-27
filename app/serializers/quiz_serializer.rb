class QuizSerializer < ActiveModel::Serializer
    attributes :id, :title, :duration, :is_public, :sessions,
                :is_completed, :identifier
end