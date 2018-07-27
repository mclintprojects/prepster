require 'rails_helper'

RSpec.describe Question, type: :model do
    it {should validate_presence_of :text}
    it {should have_many :answers}
end
