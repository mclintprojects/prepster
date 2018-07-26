require "jwt"
class User < ApplicationRecord
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_presence_of :password

    def create_jwt
        payload = {data: {user_id: self.id}}
        JWT.encode(payload, ENV["jwt_secret"], true, {algorithm : "HS256"})
    end
end
