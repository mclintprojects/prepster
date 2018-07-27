require "rails_helper"
require "json"

RSpec.describe QuizController, type: :controller do
    describe "POST #new" do
        let(:user){create(:user)}
        it "will create a quiz" do
            quiz = {
                title: "Test quiz title",
                duration: 36000,
                is_public: true,
            }
            
            before_count = Quiz.all.count
            request.headers["Authorization"] = "Bearer #{user.create_jwt}"
            post :new, params: quiz
            expect(response).to have_http_status(201)
            expect(Quiz.all.count).to eq(before_count + 1)
        end

        it "will not create two quizzes with the same title for user" do
            quiz = {
                title: "Test quiz title",
                duration: 36000,
                is_public: true,
            }
            
            request.headers["Authorization"] = "Bearer #{user.create_jwt}"
            post :new, params: quiz
            post :new, params: quiz
            expect(response).to have_http_status(422)
        end
    end

    describe "GET #get" do
        it "should get a user's quizzes" do
            quiz = create(:quiz)

            request.headers["Authorization"] = "Bearer #{quiz.user.create_jwt}"
            get :get, params: {user_id: quiz.user.id}
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body).length).to eq(1)
        end
    end

    describe "DELETE #delete" do
        it "should delete quiz" do
            quiz = create(:quiz)

            before_count = Quiz.all.count
            request.headers["Authorization"] = "Bearer #{quiz.user.create_jwt}"
            delete :delete, params: {quiz_id: quiz.id}
            expect(response).to have_http_status(200)
            expect(Quiz.all.count).to eq(before_count-1)
        end
    end
end
