require 'rails_helper'

RSpec.describe QuizSession, type: :model do
    it {should validate_presence_of :player}
    it {should validate_presence_of :score}
    it {should belong_to :quiz}
end
