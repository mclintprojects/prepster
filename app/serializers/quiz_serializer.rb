class QuizSerializer < ActiveModel::Serializer
    attributes :id, :title, :duration, :is_public, :sessions,
                :is_completed, :identifier, :creator

    def creator
        user = object.user
        "#{user.last_name} #{user.first_name}"
    end
end