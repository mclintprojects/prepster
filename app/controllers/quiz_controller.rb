class QuizController < ApplicationController
    before_action :verify_authorized

    def new
        quiz = Quiz.new(quiz_params)
        quiz.user_id = auth_user.id
        quiz.identifier = generate_identifier

        if(quiz.save)
            render json: quiz, serializer: QuizSerializer, status: 201
        else
            render json: {errors: quiz.errors.full_messages}, status: 422
        end
    end

    def get
        render json: auth_user.quizzes, each_serializer: QuizSerializer, status: 200
    end

    def delete
        quiz = Quiz.find(params[:quiz_id])
        if(quiz.user_id == auth_user.id)
            quiz.destroy
            render json: {}, status: 200
        else
            render json: {}, status: 403
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
