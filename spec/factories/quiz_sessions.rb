FactoryBot.define do
  factory :quiz_session do
    player Forgery("name").full_name
    score 20
    quiz
  end
end
