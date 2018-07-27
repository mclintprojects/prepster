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
            expect(QuizSession.all.count).to eq(before_count+1)
            expect(JSON.parse(response.body)["player"]).to eq("test")
            expect(JSON.parse(response.body)["quiz_id"]).to eq(quiz.id)
        end
    end
end
