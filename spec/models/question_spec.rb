require 'rails_helper'

RSpec.describe Question, type: :model do
    it {should validate_presence_of :text}
    it {should validate_presence_of :answer_id}
    it {should have_many :answer}
end
