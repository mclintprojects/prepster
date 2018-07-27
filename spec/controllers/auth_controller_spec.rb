require "rails_helper"
require "json"

RSpec.describe AuthController, type: :controller do
    describe "POST #signup" do
        it "will signup a valid user" do
            user = {
                first_name: Forgery("name").first_name,
                last_name: Forgery("name").last_name,
                email: Forgery("internet").email_address,
                password: Forgery("basic").password,
            }

            post :signup, params: user

            expect(response).to have_http_status(201)
            expect(JSON.parse(response.body)["user"]["first_name"]).to eq(user[:first_name])
            expect(JSON.parse(response.body)["token"].present?).to eq(true)
        end
    end
end
