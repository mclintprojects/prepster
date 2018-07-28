class QuestionController < ApplicationController
    before_action :verify_authorized

    def get
        render json: Question.where("quiz_id = ?", params[:quiz_id]), each_serializer: QuestionSerializer, status: 200
    end

    def new
        question = Question.new(text: new_question_params[:text], quiz_id: new_question_params[:quiz_id])
        question.save
        new_question_params[:answers].each_with_index do |answer, index|
            answer = Answer.create(text: answer[:text], question_id: question.id)
            
            if(index == new_question_params[:answer].to_i)
                question.update_attributes(answer_id: answer.id)
            end
        end

        render json: question, serializer: QuestionSerializer, status: 201
    end

    def update
        question = Question.find(update_question_params[:question_id])
        question.update_attributes(text: update_question_params[:text], answer_id: update_question_params[:answer_id])

        update_question_params[:answers].each_with_index do |answer, index|
            Answer.find(answer[:id]).update_attributes(text: answer[:text])
        end

        render json: question, serializer: QuestionSerializer, status: 200
    end

    def delete
        question = Question.find(params[:question_id])
        if(auth_user.id == question.quiz.user_id)
            question.destroy
            render json: {}, status: 200
        else
            render json: {}, status: 403
        end
    end

    private

    def new_question_params
        params.permit(
            :text,
            :answer,
            :quiz_id,
            answers: [:text]
        )
    end

    def update_question_params
        params.permit(
            :question_id,
            :text,
            :answer_id,
            answers: [:id, :text]
        )
    end
end
