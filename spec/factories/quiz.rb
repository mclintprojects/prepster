FactoryBot.define do
    factory :quiz do
      title Forgery("lorem_ipsum").words(2)
      duration  100
      is_public true
      is_completed true
      identifier Forgery("basic").password
      user
    end
  end