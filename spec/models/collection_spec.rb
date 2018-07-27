require 'rails_helper'

RSpec.describe Collection, type: :model do
    it {should validate_presence_of :title}
    it {should belong_to :user}
    it {should have_many :quizzes}
end
