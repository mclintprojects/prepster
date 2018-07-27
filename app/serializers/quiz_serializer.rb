class QuizSerializer < ActiveModel::Serialize
    attributes :title, :duration, :is_public, :sessions,
                :is_completed, :identifier
end