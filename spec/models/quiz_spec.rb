require 'rails_helper'

RSpec.describe Quiz, type: :model do
    it {should validate_presence_of :title}
    it {should validate_presence_of :duration}
    it {should validate_presence_of :is_public}
    it {should validate_presence_of :sessions}
    it {should validate_presence_of :is_completed}
    it {should validate_presence_of :identifier}
    it {should belong_to :user}
    it {should have_many :questions}
    it {should have_many :quiz_sessions}
end
