require "rails_helper"
require "json"

RSpec.describe QuizSessionController, type: :controller do
    describe "POST #start" do
        it "should start a quiz session" do
            quiz = create(:quiz)

            before_count = QuizSession.all.count
            request.headers["Authorization"] = "Bearer #{quiz.user.create_jwt}"
            post :start, params: {quiz_id: quiz.id, player: "test"}
            expect(response).to have_http_status(201)
            expect(Quiz.find(quiz.id).sessions).to eq(1)
            expect(QuizSession.all.count).to eq(before_count+1)
            expect(JSON.parse(response.body)["player"]).to eq("test")
            expect(JSON.parse(response.body)["quiz_id"]).to eq(quiz.id)
        end
    end

    describe "POST #mark" do
        it "should mark a quiz session" do
            quiz = create(:quiz)

            question1 = Question.create(quiz_id: quiz.id, text: "What is my name?")
            answer1 = Answer.create(question_id: question1.id, text: "Clinton")
            answer2 = Answer.create(question_id: question1.id, text: "Arthur")
            question1.update_attributes(answer_id: answer1.id)

            question2 = Question.create(quiz_id: quiz.id, text: "What is my age?")
            answer3 = Answer.create(question_id: question2.id, text: "21")
            answer4 = Answer.create(question_id: question2.id, text: "20")
            question2.update_attributes(answer_id: answer4.id)

            session = QuizSession.create(quiz_id: quiz.id, player: "Clinton")

            mark_params = {
                session_id: session.id,
                quiz_id: quiz.id,
                choices: [
                    {question_id: question1.id, answer_id: answer1.id},
                    {question_id: question2.id, answer_id: answer3.id}
                ]
            }

            request.headers["Authorization"] = "Bearer #{quiz.user.create_jwt}"
            post :mark, params: mark_params

            json = JSON.parse(response.body)

            expect(response).to have_http_status(200)
            expect(json["player"]).to eq("Clinton")
            expect(json["score"]).to eq("1/2")
            expect(json["leaderboard"].length).to eq(1)
        end
    end
end
