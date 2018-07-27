class QuizController < ApplicationController
    def new
        if(authenticated?)
            quiz = Quiz.new(quiz_params)
            quiz.user_id = auth_user.id
            quiz.identifier = generate_identifier

            if(quiz.save)
                render json: quiz, serializer: QuizSerializer, status: 201
            else
                render json: {errors: quiz.errors.full_messages}, status: 422
            end
        else
            render json: {}, status: 401
        end
    end

    private

    def generate_identifier
        identifier = SecureRandom.hex(7)
        if(Quiz.find_by(identifier: identifier))
            generate_identifier
        else
            identifier
        end
    end

    def quiz_params
        params.permit(
            :title,
            :duration,
            :is_public,
        )
    end
end
