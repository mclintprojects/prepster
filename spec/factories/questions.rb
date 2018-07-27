FactoryBot.define do
  factory :question do
    text Forgery("lorem_ipsum").words(10)
    answer
    quiz
  end
end
