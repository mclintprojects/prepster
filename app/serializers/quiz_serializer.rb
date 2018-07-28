class QuizSerializer < ActiveModel::Serializer
    attributes :id, :title, :duration, :is_public, :sessions, :created_at,
                :is_completed, :identifier, :creator, :questions_count

    def creator
        user = object.user
        "#{user.last_name} #{user.first_name}"
    end

    def questions_count
        object.questions.count
    end
end