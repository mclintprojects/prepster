require "jwt"
class User < ApplicationRecord
    has_secure_password
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates_uniqueness_of :email
    validates_presence_of :password, on: :create
    validates_length_of :password, minimum: 8, on: :create

    def create_jwt
        payload = {data: {user_id: self.id}}
        JWT.encode(payload, ENV["jwt_secret"], "HS256")
    end
end
