require 'rails_helper'

RSpec.describe QuizController, type: :controller do
    describe "POST #new" do
        it "will create a quiz" do
            user = create(:user)
            quiz = {
                title: "Test quiz title",
                duration: 36000,
                is_public: true,
                user_id: user.id
            }
            
            before_count = Quiz.all.count
            post :new, params: quiz
            expect(response).to have_http_status(201)
            expect(Quiz.all.count).to eq(before_count + 1)
        end
    end
end
