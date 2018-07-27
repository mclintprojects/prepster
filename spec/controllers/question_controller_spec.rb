require "rails_helper"
require "json"

RSpec.describe QuestionController, type: :controller do
    describe "POST #new" do
        it "should create a question for a quiz" do
            quiz = create(:quiz)
            question = {
                text: "What is my name?",
                quiz_id: quiz.id,
                answer: 1,
                answers: [{text: "Kofi"}, {text: "Clinton"}]
            }

            request.headers["Authorization"] = "Bearer #{quiz.user.create_jwt}"
            before_question_count = Question.all.count
            before_answer_count = Answer.all.count

            post :new, params: question
            expect(response).to have_http_status(201)
            expect(Question.all.count).to eq(before_question_count+1)
            expect(Answer.all.count).to eq(before_answer_count+2)
            
            question_id = JSON.parse(response.body)["id"]
            expect(Answer.last.question_id).to eq(question_id)
            expect(Answer.last.text).to eq("Clinton")
            expect(JSON.parse(response.body)["answers"].length).to eq(2)
        end
    end
end
