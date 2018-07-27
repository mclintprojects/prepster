class QuestionController < ApplicationController
    before_action :verify_authorized

    def new
        question = Question.new(text: question_params[:text], quiz_id: question_params[:quiz_id])
        question.save
        question_params[:answers].each_with_index do |answer, index|
            answer = Answer.create(text: answer[:text], question_id: question.id)
            
            if(index == question_params[:answer].to_i)
                question.update_attributes(answer_id: answer.id)
            end
        end

        render json: question, serializer: QuestionSerializer, status: 201
    end

    private

    def question_params
        params.permit(
            :text,
            :answer,
            :quiz_id,
            answers: [:text]
        )
    end
end
