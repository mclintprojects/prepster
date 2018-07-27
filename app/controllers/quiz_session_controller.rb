class QuizSessionController < ApplicationController
    before_action :verify_authorized
    
    def start
        session = QuizSession.new(session_params)
        if(session.save)
            render json: session, serializer: QuizSessionSerializer, status: 201
        else
            binding.pry
            render json: {errors: session.errors.full_messages}, status: 422
        end
    end

    private

    def session_params
        params.permit(
            :player,
            :quiz_id
        )
    end
end
