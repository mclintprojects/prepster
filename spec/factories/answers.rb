FactoryBot.define do
  factory :answer do
    text Forgery("lorem_ipsum").words(2)
    question
  end
end
