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

    describe "PUT #update" do
        it "update a quiz's question" do
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

            answers = JSON.parse(response.body)["answers"]
            updated_question = {
                text: "What is my age?",
                question_id: JSON.parse(response.body)["id"],
                answer_id: 2,
                answers: [{text: "20", id: answers[0]["id"]}, {text: "21", id: answers[1]["id"]}]
            }

            put :update, params: updated_question

            json = JSON.parse(response.body)
            expect(json["text"]).to eq(updated_question[:text])
            expect(Question.find(json["id"]).answer_id).to eq(2)
            expect(json["answers"][0]["text"]).to eq("20")
        end
    end
end
