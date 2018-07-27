class QuizController < ApplicationController
    def new
        quiz = Quiz.new(quiz)
        quiz.identifier = generate_identifier
        
        if(quiz.save)
            render json: quiz, serializer: QuizSerializer, status: 200
        else
            render json: {errors: user.errors.full_messages}, status: 422
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
            :is_public            
        )
    end
end
