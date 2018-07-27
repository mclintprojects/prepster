class QuizSessionController < ApplicationController
    def start
        session = QuizSession.new(session_params)
        if(session.save)
            quiz = Quiz.find(session.quiz_id)
            quiz.update_attributes(sessions: quiz.sessions + 1)
            render json: session, serializer: QuizSessionSerializer, status: 201
        else
            render json: {errors: session.errors.full_messages}, status: 422
        end
    end

    def mark
        session = QuizSession.find(mark_params[:session_id])
        if(session.present?)
            correct_answers = 0
            mark_params[:choices].each_with_index do |choice, index|
                question = Question.find(choice[:question_id])
                if(question.answer_id == choice[:answer_id].to_i)
                    correct_answers = correct_answers + 1
                end
            end

            session.update_attributes(score: correct_answers, completed: true)
            render json: session, serializer: MarkedQuizSessionSerializer, status: 200
        else
            render json: {}, status: 404
        end
    end

    private

    def session_params
        params.permit(
            :player,
            :quiz_id
        )
    end

    def mark_params
        params.permit(
            :quiz_id,
            :session_id,
            choices: [:question_id, :answer_id]
        )
    end
end
