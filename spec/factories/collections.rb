FactoryBot.define do
  factory :collection do
    title Forgery("lorem_ipsum").words(2)
    user
    is_public true
  end
end
